module Suma 
import Global::DW;
(
	input logic [DW-1:0]A,
	input	logic [DW-1:0]B, 
	
	output logic signed[DW-1:0]P

);
reg signed[DW:0] P_Aux;

always_comb begin 
		P_Aux = A+B;
end

assign P = P_Aux[DW-1:0];

endmodule 
