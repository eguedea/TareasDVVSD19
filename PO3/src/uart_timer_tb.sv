module uart_timer_tb;
import DataTypes::*;

bit_t clk;
bit_t reset;
bit_t reset_timer;
bit_t next_bit;

uart_timer UUT
(
.clk(clk),
.reset(reset),
.reset_timer(reset_timer),
.next_bit(next_bit)
);

initial
	begin
		clk = '0;
		forever #2 clk = !clk; 
	end

initial 
	begin
		#0 reset = '0;
		#0 reset_timer = '0;
		#2 reset = '0;
		#1000 reset_timer = '1;

	end
	

endmodule