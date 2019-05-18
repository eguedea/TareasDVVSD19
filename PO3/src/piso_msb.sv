module piso_msb #(
parameter DW = 11			
) (
input logic              clk,    // Clock
input logic              reset,    // asynchronous reset low active 
input logic              enb,    // Enable
input logic              load,    // load or shift
input	logic				  shift,
input logic [DW-1:0]     inp,    // data input
input logic					fsmReset,
output logic             out     // Serial output
);

logic [DW-1:0]      rgstr_r;

always_ff@(posedge clk or negedge reset) begin: rgstr_label
    if(!reset)
        rgstr_r  <= '1;
	 
    else begin
			if (enb) begin
			  if (load)
					rgstr_r  <= inp;
			  else if(shift)
					rgstr_r  <= {rgstr_r[DW-2:0], 1'b1};
			end 
				
	end
end:rgstr_label



//assign out  = rgstr_r[DW-1];

always_comb
begin
	if(fsmReset)
		 out <= '1;
	else
		out  = rgstr_r[DW-1];    // MSB bit is the first to leave
	
end
//TODO: try to design a piso register, where the LSB bit leave the register first and then the LSB bit+1.
endmodule