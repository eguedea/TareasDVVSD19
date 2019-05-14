module circularfifo
import DataTypes::*;
(
input bit_t uart_clk,
input bit_t processor_clk,
input bit_t reset,
input fifo_in datainput,
input bit_t push,
input bit_t pop,
output fifo_out dataoutput,
output bit_t full,
output bit_t empty
);



ADDR_W pointerWADDToRAMWadd_wire;
bit_t pointerWENToRAMWen_wire;
ADDR_W rpointerRADDToRAMRadd_wire;
bit_t rpointerRENToRAMRen_wire;

simple_dual_port_ram_dual_clock RAM1
(
.clk_w (uart_clk),
.clk_r (processor_clk),
.en_w (pointerWENToRAMWen_wire),
.en_r (rpointerRENToRAMRen_wire),
.data (datainput),
.read_addr (rpointerRADDToRAMRadd_wire),
.write_addr (pointerWADDToRAMWadd_wire),
.reset (reset),
.ram_out (dataoutput)
);

pointers wpointers
(
.clk (uart_clk),
.reset (reset),
.push (push),
.w_add (pointerWADDToRAMWadd_wire),
.w_en (pointerWENToRAMWen_wire)
);

readpointers rpointers
(
.clk (processor_clk),
.reset (reset),
.pop (pop),
.r_add (rpointerRADDToRAMRadd_wire),
.r_en (rpointerRENToRAMRen_wire)
);

uartToProcessorComp utpc1
(
.w_add (pointerWADDToRAMWadd_wire),
.processor_clk (processor_clk),
.reset (reset),
.r_add (rpointerRADDToRAMRadd_wire),
.comp_empty (empty)
);

processorToUartComp ptuc1
(
.r_add (rpointerRADDToRAMRadd_wire),
.uart_clk (uart_clk),
.reset (reset),
.w_add (pointerWADDToRAMWadd_wire),
.comp_full (full)
);

endmodule


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





