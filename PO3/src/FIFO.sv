module FIFO
import DataTypes::*;
(
input bit_t clk,
input bit_t reset,
input fifo_in datainput,
input bit_t push,
input bit_t pop,
output fifo_out dataoutput,
output bit_t full,
output bit_t empty
);

endmodule
