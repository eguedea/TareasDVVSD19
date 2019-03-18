`timescale 1ns / 1ps

module top_tb;

	logic [7:0] data;
	logic clk;
	logic rst;
	logic [7:0] out [2:0];
	logic sign;
	
	top uut(
	.data(data),
	.clk(clk),
	.rst(rst),
	.out(out),
	.sign(sign)
	
	);
	
	initial begin
	
	#10
	rst = 0;
	#10 rst = 1;
	#10 rst = 0;
	data = 8'b10000010;
		#10 rst = 1;
	#10 rst = 0;

	
	end
always begin
    forever #1 clk <= ~clk;
end

endmodule
	