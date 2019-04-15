`timescale 1ns / 1ps
module Division_Top_TB;
import Global::DW;

	logic		   clk;
	logic			rst;
	logic			start;
	logic  [DW-1:0] Dividendo;
	logic  [DW-1:0] Divisor;
	logic			ready;
	logic  [DW-1:0] Residuo;
	logic  [DW-1:0] Cosiente;

	Division_Top uut(
	.clk(clk),
	.rst(rst),
	.start(start),
	.Dividendo(Dividendo),
	.Divisor(Divisor),
	.ready(ready),
	.Residuo(Residuo),
	.Cosiente(Cosiente)
	);
	
	initial begin
	#10
	 rst     = 0;
    clk     = 0;
    start   = 1;
	 rst	= 1;
	 Dividendo = 4'b1111;
	 Divisor = 4'b0011;
	 
	 #2
	 #4 start   = 0;

	
	

	 end		
	 
always begin
    forever #1 clk <= ~clk;
end

endmodule 