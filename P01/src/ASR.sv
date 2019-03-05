//Nombre: Arithmetic Right Shift (ASR)
//Descripcion: Hace un shift hacia la derecha
//Entrada: A
//Salida: C
//Autor: Eric Guedea Osuna
//Fecha:

module ASR #(
parameter DW = 4
)(
	input logic [DW-1:0] A,
	output logic [DW-1:0] C
);

assign C = A>>1;

endmodule