//Nombre: doubledabble
//Descripcion: se genera la salida de centenas decenas y unidades generadas con el algoritmo double dabble, es necesario resetear
//Entrada: clk, rst, in
//Salida: centout, decout, uniout
//Autor: Alberto Contreras, Eric Guedea Osuna
//Fecha: 17 de marzo del 2019

module doubledabble(
input clk,
input logic rst,
input logic [7:0] in,
output logic [3:0] centout,
output logic [3:0] decout,
output logic [3:0] uniout

);
logic ready = 0;
logic [19:0] reservedSpace = 0;

always_ff@(posedge clk or negedge rst) begin
	if(!rst) begin
		centout <= '0;
		decout <= '0;
		uniout <= '0;
		reservedSpace = {{12{1'b0}},in};

	end else begin
		if(reservedSpace[19:16] > 4'd4) begin
				reservedSpace <= {reservedSpace[19:16] + 4'd3,reservedSpace[15:0]};
				reservedSpace <= reservedSpace << 1;
			end
		 if(reservedSpace[15:12] > 4'd4) begin
				reservedSpace <= {reservedSpace[19:16],reservedSpace[15:12] + 4'd3,reservedSpace[11:0]};
				reservedSpace <= reservedSpace << 1;

			end
		 if(reservedSpace[11:8] > 4'd4) begin
				reservedSpace <= {reservedSpace[19:12], reservedSpace[11:8] + 4'd3, reservedSpace[7:0]};
				reservedSpace <= reservedSpace << 1;
			end
		reservedSpace <= reservedSpace << 1;
		if(reservedSpace[7:0] == '0)
			ready <= '1;
		if(ready) begin
			centout <= reservedSpace[19:16];
			decout <= reservedSpace[15:12];
			uniout <= reservedSpace[11:8];
		end
		
	end
	
end

endmodule