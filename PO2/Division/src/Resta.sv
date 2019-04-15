module Resta 

import Global::DW;
(
	input logic [DW-1:0]A,
	input	logic [DW-1:0]B, 
	input logic Aux,
	
	output logic signed[DW-1:0]P

);
reg signed[DW:0] P_Aux;
always_comb begin 
if(Aux)begin
		P_Aux = A-B;
end
else 
	P_Aux = 4'b0000;
end

assign P = P_Aux[DW-1:0];
endmodule 