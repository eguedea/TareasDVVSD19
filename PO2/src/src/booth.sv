//Nombre: Booth
//Descripcion: Modulo que ejecuta el algoritmo de booth
//cuando este recibe la orden de la maquina de estados, el algoritmo dura N ciclos de reloj
//Entrada:Clock, reset, load, Multiplicand_in, M, Product_Aux
//Salida: Producto_aux
//Autor: Alberto Contreras, 			Eric Guedea Osuna
//Fecha: 11 de marzo del 2019

module Booth
import Global::*;
(
// Input Ports
input clk,
input reset,
input load,
input ready,
input [DW-1:0] Multiplicand_in,
input [DW-1:0] OperacionSuma,
input [DW-1:0] OperacionResta,
input [DW_2:0] Product_Aux,

// Output Ports
output logic [DW_2:0] Producto,
output logic [DW-1:0] Producto_Op
);

reg [1:0]Qm;
//reg signed [DW-1:0]OperacionResta,OperacionSuma;
//reg Aux;



always_ff@(posedge clk or negedge reset) begin
	if(reset == 1'b0) 
	begin
		Qm <= 1'b0;
		//Aux <= 1'b0;
	end
	else 
	begin
		if (load == 1'b0)
		begin
			Producto <= {{DW{1'b0}},Multiplicand_in,1'b0};
			Qm <= {Multiplicand_in[0],1'b0};
		end
		else begin
		
		if (ready==0)begin
				case(Qm)
					0: begin 
						Producto <= Product_Aux >>> 1;
						Qm <= Product_Aux[2:1];
					end
						
					1: begin 
						Producto <= {Product_Aux[DW*2],OperacionSuma,Product_Aux[DW:1]};
						Qm <= Product_Aux[2:1];
						//Aux <= 0;
					end
					2: begin 
						Producto <= {Product_Aux[DW*2],OperacionResta,Product_Aux[DW:1]};
						Qm <= Product_Aux[2:1];
						//Aux <= 1;
					end
					3: begin 
						Producto <= Product_Aux >>> 1;
						Qm <= Product_Aux[2:1];
					end
					default:	Producto <= Product_Aux >>> 1;
				endcase
			end
		end
	end
end
assign Producto_Op = Product_Aux[DW_2:DW_2-(DW-1)];



endmodule
