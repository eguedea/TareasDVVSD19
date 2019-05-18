/*interface circularfifo_if ();
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


modport RAM1
(
input bit_t en_w,
input bit_t en_r,
input DATA_W data,
input ADDR_W read_addr, 
input ADDR_W write_addr,
output DATA_W ram_out
);

modport wpointers
(

input bit_t push,
output RAM_size w_add,
output bit_t w_en
);



modport rpointers
(
input bit_t pop,
output RAM_size r_add,
output bit_t r_en
);

modport UtP
(
input ADDR_W w_add,
input ADDR_W r_add,
output  bit_t comp_empty
);

modport PtU
(
input ADDR_W r_add,
input ADDR_W w_add,
output bit_t comp_full
)

endinterface
*/