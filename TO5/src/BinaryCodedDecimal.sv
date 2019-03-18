//Nombre: BinaryCodedDecimal
//Descripcion: recibe 4 bits y lanza su decodificacion en decimal
//Entrada: un numero de 4 bits
//Salida: 8 bits decodificados para un display de 7 segmentos
//Autor: Alberto Contreras,Eric Guedea Osuna
//Fecha: 5/02/19

module BinaryCodedDecimal(
	BCDIn,
	BCDOut
);
input [3:0] BCDIn;
output [6:0] BCDOut;

always_comb begin
case(BCDIn)
	4'h0: BCDOut = 7'b1111110;
	4'h1: BCDOut = 7'b0100000;
	4'h2: BCDOut = 7'b1101101;
	4'h3: BCDOut = 7'b1111001;
	4'h4: BCDOut = 7'b0110011;
	4'h5: BCDOut = 7'b1011011;
	4'h6: BCDOut = 7'b1011111;
	4'h7: BCDOut = 7'b1110000;
	4'h8: BCDOut = 7'b1111011;
	4'h9: BCDOut = 7'b1111011;
	default : BCDOut = 7'b0000000;
	endcase

end
	
endmodule