//Nombre: divdefreq.sv
//Descripcion: divisor de frequencia a base de contadores.
//Entrada: una señal de reloj, reset
//Salida: una señal de reloj con menor frecuencia que la original
//Autor: Eric Guedea Osuna
//Fecha: 18/02/19
module divdefreq 
	(
	input logic clk,
	input logic reset,
	output logic clkOut
	);
	parameter FRECUENCY = 25000000; //Frecuencia a generar expresada en hertz
	parameter REFERENCE_CLOCK = 50_000_000; //Frecuencia de referencia expresada en Hertz
	parameter MAX = REFERENCE_CLOCK / (2*FRECUENCY); //NUMERO A CONTAR PARA OBTENER LA FRECUENCIA.
	
	logic[24:0] counter = 0; //25 bits to support frequency dividing up to 1Hz 
	
	always_ff@(posedge clk or negedge reset) begin :divdefreq
		if(!reset)
			clkOut <= 0;	
		else if(counter == MAX-1) begin
			counter <= 0;
			clkOut <= ~clkOut;
			end
		else 
			counter <= counter + 1;
	
	end :divdefreq
	
	endmodule