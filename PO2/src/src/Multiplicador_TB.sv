`timescale 1ns / 1ps
module Multiplicador_TB;
import Global::DW;

	logic		   clk;
	logic			rst;
	logic			start;
	logic  [DW-1:0] multiplicand;
	logic  [DW-1:0] multipliers;
	logic			ready;
	logic  [(DW*2)-1:0] product;
	logic  [(DW*2)-1:0] ProductoFinal;

	Multiplicador uut(
	.clk(clk),
	.rst(rst),
	.start(start),
	.multiplicand(multiplicand),
	.multipliers(multipliers),
	.ready(ready),
	.product(product),
	.ProductoFinal(ProductoFinal)
	);
	
	initial begin
	#10
	 rst     = 0;
    clk     = 0;
    start   = 1;
	 rst	= 1;
	 multiplicand = 9'b001010101;//85
	 multipliers = 9'b001111111;//127
	 #2 start   = 0;
	 #20
	 start   = 1;
	 multiplicand = 9'b001010101;
	 multipliers = 9'b001010101;

	 end		
	 
always begin
    forever #1 clk <= ~clk;
end

endmodule 