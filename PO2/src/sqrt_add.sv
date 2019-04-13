module sqrt_add #(
parameter DW = 16,
parameter DW_2 = 8
) (
 input logic clk,
 input logic	reset,
 input logic 	load,
 input logic	start,
 input logic ctrl,
 input logic [DW-1:0] D,
 input logic [DW-1:0] excounter,
 output logic [(DW/2)-1:0] Q,
 output logic [(DW/2)-1:0] remainder,
 output logic ready
);


reg  [DW_2-1:0] Qm = 0;
logic [DW_2-1:0] R = 0;
logic QmCtrl = 0;
//logic  [DW-1:0] Dm = 0;

//Internal Connection Wires
logic [DW-1:0] fromASRtoAnd;
logic [DW-1:0] OrExit;
logic [DW_2-1:0] Restador_result;
logic [DW_2-1:0] Sumador_result;
logic [DW_2-1:0] Qm_Out;


always@(posedge clk or negedge reset) begin

if(reset == 1'b0) begin
		Qm <= {DW_2{1'b0}};
		R <= {DW_2{1'b0}};
		end else begin
		
		
		if (load == 1'b0) begin
			if(R>=0) begin
				R <= Restador_result;
				QmCtrl = 1;
			end else begin
				R <= Sumador_result;
				QmCtrl = 1;
				end
		if(QmCtrl)
			Qm <= Qm_Out;
			end
		end
	
end

assign Q = Qm;
assign remainder = R;

counted_asr ASR1 (
.D	(D),
.R (R),
.excounter	(excounter),
.out	(fromASRtoAnd)
);
/*
R_logic lgc1 (
.R	(R),
.ASRin	(fromASRtoAnd),
.OroutQ	(OrExit)
);
*/
restador RE1 (
.A	(( (Qm<<2) | 3)),
.B	(fromASRtoAnd),
.Out (Restador_result)
);
sumador SU1 (
.A	(( (Qm<<2) | 1)),
.B	(fromASRtoAnd),
.Out (Sumador_result)
);


Qassign QAS1 (
.Rresult (R),
.Q	(Qm),
.Qout	(Qm_Out)
);




endmodule