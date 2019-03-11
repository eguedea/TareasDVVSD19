//Nombre: Booth
//Descripcion: Modulo que ejecuta el algoritmo de booth
//cuando este recibe la orden de la maquina de estados, el algoritmo dura N ciclos de reloj
//Entrada:Clock, reset, load, Multiplicand_in, M, Product_Aux
//Salida: Producto_aux
//Autor: Alberto Contreras, Eric Guedea Osuna
//Fecha: 11 de marzo del 2019

module Booth
#(
parameter DW = 8
)
(
// Input Ports
input clk,
input reset,
input load,
input ready,
input [DW-1:0] Multiplicand_in,
input [DW-1:0] M,
input [2*DW:0] Product_Aux,

// Output Ports
output logic [2*DW:0] Producto
);

reg [1:0]Qm;

always_ff@(posedge clk or negedge reset) begin
	if(reset == 1'b0) 
		Qm <= 1'b0;
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
						Producto <= {Product_Aux[DW*2],Product_Aux[DW*2:1]};
						Qm <= Product_Aux[2:1];
					end
						
					1: begin 
						Producto <= {Product_Aux[DW*2],Product_Aux[(DW*2):(DW*2)-(DW-1)]+M,Product_Aux[DW:1]};
						Qm <= Product_Aux[2:1];
					end
					2: begin 
						Producto <= {Product_Aux[DW*2],Product_Aux[(DW*2):(DW*2)-(DW-1)]-M,Product_Aux[DW:1]};
						Qm <= Product_Aux[2:1];
					end
					3: begin 
						Producto <= {Product_Aux[DW*2],Product_Aux[DW*2:1]};
						Qm <= Product_Aux[2:1];
					end
					default:	Producto <= {Product_Aux[DW*2],Product_Aux[DW*2:1]};
				endcase
			end
		end
	end
end

endmodule
