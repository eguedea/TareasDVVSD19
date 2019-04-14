`timescale 1ns / 1ps

module sqrt_TB;

parameter DW = 16;
	logic clk;
	logic reset;
	logic load;
	logic start;
	logic ctrl;
	logic [DW-1:0] D;
	logic [DW-1:0] excounter;
	logic [DW-1:0] Q;
	logic [DW-1:0] remainder;
	logic ready;
	
	sqrt_add UUT(
	.clk(clk),
	.load(load),
	.reset(reset),
	.start(start),
	.ctrl(ctrl),
	.D(D),
	.excounter(excounter),
	.Q(Q),
	.remainder(remainder),
	.ready(ready)
	);
	
	initial begin
	#10	

	D = 16'd127;
	reset = 0;
	#4;

	clk = 0;
	start = 0;
	reset = 1;
	load = 0;
	ctrl = 0;
	excounter = 16'd8;
	#2
	excounter = 16'd7;
	#2
	excounter = 16'd6;
	#2
	excounter = 16'd5;
	#2
	excounter = 16'd4;
	#2
	excounter = 16'd3;
	#2
	excounter = 16'd2;
	#2
	excounter = 16'd1;
	#2
	excounter = 16'd0;
	#2
	ctrl = 1;
	end
	
always begin
	forever #1 clk <= ~clk;
end

endmodule