module sqrt #(
parameter DW = 16,
parameter p_three = {{DW-2{1'b0}},2'b11}

) (
 input logic clk,
 input logic	reset,
 input logic 	load,
 input logic	start,
 input logic ctrl,
 input logic [DW-1:0] D,
 input logic [DW-1:0] excounter,
 output logic [DW-1:0] Q,
 output logic [DW-1:0] remainder,
 output logic ready
);
logic signed [DW-1:0] Qm = 0;
logic signed [DW-1:0] R = 0;


logic signed[DW-1:0] D_shift_comp = 0;
logic signed[DW-1:0] R_shift = 0;
logic signed[DW-1:0] Qm_shift_one = 0;
logic signed[DW-1:0] Qm_shift_zero = 0;
logic signed[DW-1:0] partial_R = 0;


always@(posedge clk or negedge reset) begin
	if(reset == 1'b0)
		Qm <= 16'b0;
	else
	begin
		if (load == 1'b0)
			begin
			D_shift_comp <= ((R << 2) | (D >> ( excounter + excounter) & 16'd3));
			R_shift <= (R << 2);
			
				if((R[DW-1] || R == '0)) begin

					//R <= (R << 2) | (D >> ( excounter + excounter) & {{DW-2{1'b0}},2'b11});
					R <= ( (R_shift | D_shift_comp) - Qm_shift_one);
					
					

				end else begin
				//	R <= (R << 2) | (D >> (excounter + excounter ) & {{DW-2{1'b0}},2'b11});
					R <= ( (R_shift | D_shift_comp) - Qm_shift_zero);
				end

				if((R[DW-1]) || R == '0) begin
					Qm <= (Qm << 1) | 1;
					ready <= 1;
				end else begin
					Qm <= (Qm << 1) | 0;
					ready <= 0;

				end
				
				
				if(ctrl == 1)
					if( R[DW-1] == 1'b1 )
						R <= R +((Qm << 1) | 1);	
					
			end
	end
end




assign Q = Qm;
assign remainder = R;



endmodule	
