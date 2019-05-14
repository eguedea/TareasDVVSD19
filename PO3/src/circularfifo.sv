module circularfifo
import DataTypes::*;
(
input bit_t clk_uart,
input bit_t clk_processor,
input bit_t reset,
input fifo_in datainput,
input bit_t push,
input bit_t pop,
output fifo_out dataoutput,
output bit_t full,
output bit_t empty
);

bit_t pointerWADDToRAMWadd_wire;
bit_t pointerWENToRAMWen_wire;

pointers wpointers
(
.clk (clk_uart),
.reset (reset),
.push (push),
.w_add (pointerWADDToRAMWadd_wire),
.w_en (pointerWENToRAMWen_wire)
);
//always_ff@(posedge clk or negedge reset)
//begin
//	if(!reset)
//	begin
//		dataoutput = '0;
//		full = '0;
//		empty = '0;
//	end
//	else
//		
//	begin
//	
//	end
//		
//
//end





endmodule