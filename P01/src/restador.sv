//Nombre: Bloque Restador
//Descripcion: Resta el numero B de A
//Entrada: A, B
//Salida: resultado
//Autor: Eric Guedea Osuna
//Fecha:

module restador #(
parameter DW = 4
)(
	input logic [DW-1:0] A,
	input logic [DW-1:0] B,
	output logic [DW-1:0] C
);

assign C = A-B;

endmodule
