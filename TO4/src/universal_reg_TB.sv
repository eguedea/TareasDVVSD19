`timescale 1ns / 1ps
module universal_reg_TB;

logic           clk;
logic           rst;
logic           enb;
logic           l_s;
logic [3:0]     inp;
logic	  [2:0] reg_switch;
logic          [3:0] out;


universal_reg uut(
.clk    (clk    ),
.rst    (rst    ),
.enb    (enb    ),
.l_s    (l_s    ),
.inp    (inp    ),
.reg_switch		(reg_switch		),
.out    (out    )
);

initial begin
            rst     = 0;
            clk     = 0;
            enb     = 0;
            l_s     = 0;
            inp     = 0;
            rst     = 1;
    #10.2   rst     = 0;
    #4.2    rst     = 1;
    #5      enb     = 1;
    #5      l_s     = 1;
				reg_switch = 0;
            inp     = $urandom%16;
    #2      l_s     = 0;
    #8      l_s     = 1;
            inp     = $urandom%16;
    #2      l_s     = 0;
    #8      l_s     = 1;
            inp     = $urandom%16;
    #2      l_s     = 0;
    #8      l_s     = 1;
            inp     = $urandom%16;
    #2      l_s     = 0;
    #8      l_s     = 1;
            inp     = $urandom%16;
    #2      l_s     = 0;
    #8      l_s     = 1;
            inp     = $urandom%16;
    #2      l_s     = 0;
    #8      l_s     = 1;
            inp     = $urandom%16;
    #2      l_s     = 0;
    #8      l_s     = 1;
            inp     = $urandom%16;
    #2      l_s     = 0;
    #8      l_s     = 1;
            inp     = $urandom%16;
    #2      l_s     = 0;
    #5      inp     = $urandom%16;
    #3      inp     = $urandom%16;
    #6      inp     = $urandom%16;
	reg_switch = 1;
					#12
					reg_switch = 2;
					#12
					reg_switch = 3;
					#12
					reg_switch = 4;
					#12
					reg_switch = 5;
					 #1      inp     = 4'b0001;
					#10      inp     = 4'b0000;
					reg_switch = 6;
					 #1      inp     = 4'b0001;
					#10      inp     = 4'b0000;
    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule