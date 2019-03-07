`timescale 1ns / 1ps
module multiplier_tb;
	logic		   clk;
	logic				rst;
	logic				start;
	logic  multiplicand;
	logic  multipliers;
	logic			ready;
	logic  product;

	multiplier uut(
	.clk(clk),
	.rst(rst),
	.start(start),
	.multiplicand(multiplicand),
	.multipliers(multipliers),
	.ready(ready),
	.product(product)
	);
	
	initial begin
	#10
	 rst     = 0;
    clk     = 0;
    start     = 0;
	 rst	= 1;
	 multiplicand = 4'b1011;
	 multipliers = 4'b1011;
	 #10 start = 1;
	 end
	 
always begin
    forever #1 clk <= ~clk;
end

endmodule