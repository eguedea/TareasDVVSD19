//Nombre: twoscomplement
//Descripcion: convierte la entrada por medio de complemento a dos
//Entrada: data
//Salida: out
//Autor: Alberto Contreras, Eric Guedea Osuna
//Fecha: 17 de marzo del 2019

module twoscomplement #(
parameter DW=8
) (
input [DW-1:0] data,
output [DW-1:0] out
);


assign out = (~data) + 1'b1;

endmodule 