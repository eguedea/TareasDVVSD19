//Nombre:Top
//Descripcion: Top para una maquina de parpadeos, basada en una maquina de estados 
//Entrada: clock, reset, start.
//Salida: out, salida a un Hz
//Autor: Eric Guedea Osuna
//Fecha: 21/02/19

module Top (
	input logic clk,
	input logic reset,
	input logic start,
	output logic out,
	output logic hzClk
);

wire divisorToStateMachine;

divdefreq  div0 (
.clk(clk),
.reset(reset),
.clkOut(divisorToStateMachine)
);

stateMachine sm0 (
.clk(divisorToStateMachine),
.reset(reset),
.start(start),
.out(out)
);

assign hzClk = divisorToStateMachine;

endmodule