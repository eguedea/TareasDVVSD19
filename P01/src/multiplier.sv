module multiplier #(
parameter DW = 4
) (
	input 		   clk,
	input				rst,
	input				start,
	input logic [DW-1:0] multiplicand,
	input logic [DW-1:0] multipliers,
	output			ready,
	output logic [(DW*2)-1:0] product
);



	wire [DW-1:0] REGmultipliers;
	wire [DW-1:0] REGmultiplicand;
	wire [1:0] WireQ0_1;
	wire [DW:1] WireQ;
	wire [DW*2:DW+1] WireA;
	wire [DW-2:0] WireOut_N;
	wire [DW*2:0] WireProductToSemiProduct;
	wire [DW*2-1:0] WireRegProductToPIPO;
	wire ReadyToPIPO;
	
PIPO PP0(
.clk	(clk),
.rst	(rst),
.enb	(start),
.inp	(multiplicand),
.out	(REGmultiplicand)
);

PIPO PP1(
.clk	(clk),
.rst	(rst),
.enb	(start),
.inp	(multipliers),
.out	(REGmultipliers)
);

PIPO PP2(
.clk	(clk),
.rst	(rst),
.enb	(readyToPIPO),
.inp	(WireRegProductToPIPO),
.out	(product)
);

SemiProduct SP0(
.clk	(clk),
.rst	(rst),
.start	(start),
.Multiplier_Q	(REGmultipliers),
.Product	(WireProductToSemiProduct),
.Q0_1	(WireQ0_1),
.Q	(WireQ),
.A	(WireA),
.Out_N	(WireOut_N)
);

booth bth0(
.clk	(clk),
.rst	(rst),
.start	(start),
.Q(WireQ),
.A(WireA),
.M(REGmultiplicand),
.Qm(WireQ0_1),
.N(WireOut_N),
.ready(readyToPIPO),
.ready_f (ready),
.product(WireProductToSemiProduct),
.f_product(WireRegProductToPIPO)

);
endmodule

