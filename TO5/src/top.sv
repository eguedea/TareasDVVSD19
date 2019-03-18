//Nombre: top
//Descripcion: 
//Entrada:
//Salida:
//Autor: Alberto Contreras, Eric Guedea Osuna
//Fecha: 17 de marzo del 2019

module top(
input logic [7:0] data,
input logic clk,
input logic rst,
output logic [7:0] out[2:0],
output logic sign
);

wire [7:0] TwoscomplementToDoubledabble;
//wire [3:0] CentDoubledabbleToDecoder;
//wire [3:0] DecDoubledabbleToDecoder;
//wire [3:0] UniDoubledabbleToDecoder;
wire [3:0] DoubledabbleToDecoder [2:0];

twoscomplement TwoscomplementIn(
	.data(data),
	.out(TwoscomplementToDoubledabble)
);

doubledabble BinaryToBCD(
	.clk(clk),
	.rst(rst),
	.in(TwoscomplementToDoubledabble),
	.centout(DoubledabbleToDecoder[0]),
	.decout(DoubledabbleToDecoder[1]),
	.uniout(DoubledabbleToDecoder[2])
);

generate
genvar i;
for(i = 0; i < 3; i++) begin : BCDcreation
	BinaryCodedDecimal genBCD(
		.BCDIn(DoubledabbleToDecoder[i]),
		.BCDOut(out[i])
	);
	end
endgenerate

assign sign = data[7];
endmodule