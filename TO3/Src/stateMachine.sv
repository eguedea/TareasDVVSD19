
//Nombre: stateMachine
//Descripcion: Maquina de estados con contadores, enciende una señal durante 6 tiempos y la apaga durante 4 tiempos ciclicamente
//Entrada: clk, reset, start
//Salida: out, oneHz
//Autor: Alberto Contreras Estrada, Eric Guedea Osuna 
//Fecha:
module stateMachine(
	input clk,
	input logic reset,
	input logic start,
	output logic out
);

enum logic [1:0] {ledON, ledOFF} states;

logic [3:0] fsmCounter = 0; 

always_ff@(posedge clk or negedge reset) begin
	if(!reset)
		states <= ledON;
	else begin
		case(states) 
			ledON: begin
				out <= '1;
				if(fsmCounter == 4'd5)
					states <= ledOFF;
				else
					fsmCounter <= fsmCounter + 1 ;
				end
			ledOFF: begin
				out <= 0;
			   if (fsmCounter == 4'd8) begin
					fsmCounter <= 0;
					states<= ledON;
					end
					else
						fsmCounter <= fsmCounter + 1 ;
				end
			default: out <= '1;
		endcase
	end
	
end






endmodule
