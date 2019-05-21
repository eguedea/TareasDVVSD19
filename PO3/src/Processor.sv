module Processor 
import ControlRx_in::*; 
(
	input clk,
	input reset, 
	input enable,
	input DataIn_t size,
	input Matriz_t Matriz,//(size * C_0 : size*(C_0+1)-1)
	input DataIn_t Cntrl_P,
	input DataIn_t Vector, // C_0
	input DataIn_t Acomulador, // se conecta al modulo siguiente 

	output DataIn_t Out_P,
	output One_t Cnt_P
);

DataIn_t Counter;
DataIn_t Resultado;
always_ff @(posedge clk  or negedge reset) begin:Processor
	if(!reset)begin
		Counter <= 0;
		Cnt_P <= 0;
	end
	else
	begin 
		if(enable)
		begin 
			if(Counter < size)begin
				Resultado <= (Matriz[(Counter*size)+Cntrl_P] * Vector) + Acomulador;
				Counter++;
			end
			else begin
				Cnt_P <= 1;
				Counter <= 0;
			end 
		end
		 
	end 
end:Processor 

assign Out_P = Resultado;

endmodule 

