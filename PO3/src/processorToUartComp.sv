module processorToUartComp
import DataTypes::*;
(
input bit_t r_add,
input bit_t uart_clk,
input ADDR_W w_add,
input bit_t reset,
output bit_t comp_full
);

bit_t bin2grayToFF_wire;
bit_t FFToGray2bin_wire;
bit_t gray2binToComp_wire;

binToGray bin2gray2
(
.bin (r_add),
.gray (bin2grayToFF_wire)
);

dualFF FF2
(
.clk (uart_clk),
.reset (reset),
.D (bin2grayToFF_wire),
.Q (FFToGray2bin_wire)
);

grayToBin gray2bin2
(
.gray (FFToGray2bin_wire),
.bin (gray2binToComp_wire)
);

Comparator comp2
(
.value (w_add),
.compare_value (gray2binToComp_wire),
.compare_flag (comp_full)
);

endmodule