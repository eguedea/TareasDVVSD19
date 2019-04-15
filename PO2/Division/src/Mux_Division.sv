module Mux_Division 
import Global::*;
(
	input logic [DW_2-1:0]A,
	input	logic [DW-1:0]Suma, 
	input logic Sel,
	
	output logic [DW_2-1:0]P

);
reg [DW_2:0] Out_Aux;

always_comb begin 
	if(Sel)
		Out_Aux = {Suma,A[DW-1:1],1'b0};
	else
		Out_Aux = {1'b0,A[DW_2-1:1],1'b1};
end
assign P = Out_Aux[DW_2-1:0];



endmodule 