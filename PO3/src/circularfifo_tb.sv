module circularfifo_tb;
import DataTypes::*;

 bit_t uart_clk;
 bit_t processor_clk;
 bit_t reset;
 fifo_in datainput;
 bit_t push;
 bit_t pop;
 fifo_out dataoutput;
 bit_t full;
 bit_t empty;
 
 circularfifo UUT
 (
 .*
 );
 
 initial
	begin
		uart_clk = '0;
		forever #0.5 uart_clk = !uart_clk; 
	end

initial
	begin
		processor_clk = '0;
		forever #5 processor_clk = !processor_clk;
	end
	
initial
	begin
	#2 reset = '0;
	#4 reset = '1;
	#1 datainput = 8'd325;
	#1 push = '1;
	#1 push = '0;
	
	#2 datainput = 8'd400;
	#2 push = '1;
	#2 push = '0;
	
	#2 datainput = 8'd500;
	#2 push = '1;
	#2 push = '0;
	
	#2 datainput = 8'd750;
	#2 push = '1;
	#2 push = '0;
	
	#5 pop = '1;
	#5 pop = '0;
	#5 pop = '1;
	#5 pop = '0;
	#5 pop = '1;
	#5 pop = '0;
	
	end
endmodule
 