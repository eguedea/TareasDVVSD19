module uart_transmitter_tb;
import DataTypes::*;

bit_t clk;
bit_t reset;
bit_t transmit;
uint8_t data;
bit_t serial_output_rx;
bit_t busy;
bit_t div;

uart_transmitter UUT
(
.*
);

initial
	begin
		clk = '0;
		forever #0.5 clk = !clk; 
	end

initial
	begin
		#2 reset = '0;
		#3 reset = '1;
		data = 8'b1011010;
		#2 transmit = '1;
		#4 transmit = '0;
		#10000
		data = 8'd0;

		#2 transmit = 1;
		#2 transmit = 0;
	end
	
endmodule