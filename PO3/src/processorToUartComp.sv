module processorToUartComp
import DataTypes::*;
(
input ADDR_W r_add,
input bit_t uart_clk,
input bit_t reset,
input ADDR_W w_add,
output bit_t comp_full
);

ADDR_W bin2grayToFF_wire;
ADDR_W FFToGray2bin_wire;
ADDR_W gray2binToComp_wire;

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