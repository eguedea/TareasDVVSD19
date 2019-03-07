`timescale 1ns / 1ps
module booth_tb;

bit clk = 0;
logic rst;
logic start;
logic [3:0]	Q;
logic [3:0] A;
logic [3:0] M;
logic [1:0] Qm;
logic [3:0] N;
logic ready;
logic [8:0] product;


booth uut(
.clk    (clk    ),
.rst    (rst    ),
.start    (start    ),
.Q    (Q    ),
.A    (A    ),
.M		(M		),
.Qm    (Qm    ),
.N		(N		),
.ready (ready	),
.product (product	)
);

initial begin
	rst = 0;
	start = 0;
	Q = 4'b0110;
	A = 4'b0001;
	Qm= 2'b01;
	M = 4'b1011;
	#10 rst = 1;
	#10 start = 1;
	
	end
always begin
    forever #1 clk <= ~clk;
end

endmodule