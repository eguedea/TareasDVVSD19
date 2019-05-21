module Mux_Processor
import ControlRx_in::*; 
(	
	input DataIn_t Size, // [7:0]
	input Matriz_t Matriz, // [7:0]name [63:0]
	input Vector_t Vector, // [7:0]name [7:0]
	output O P0_Out,P1_Out,P2_Out,P3_Out
);
wire [7:0]size;

assign size = Size;
always_comb begin 
	if(Cntrl_P1 == 1)
		P0_Out = Matriz[0:size];
	else
		P0_Out = Matriz[size*4:(size*5)-1];;
end 

always_comb begin 
	if(Cntrl_P2 == 1)
		P1_Out = Matriz[size:(size*2)-1];
	else
		P1_Out = Matriz[size*5:(size*6)-1];
end 

always_comb begin 
	if(Cntrl_P3 == 1)
		P2_Out = Matriz[size*2:(size*3)-1];
	else
		P2_Out = Matriz[size*6:(size*7)-1];
end 

always_comb begin 
	if(Cntrl_P4 == 1)
		P3_Out = Matriz[size*3:(size*4)-1];
	else
		P3_Out = Matriz[size*7:(size*8)-1];
;
end 


endmodule 
