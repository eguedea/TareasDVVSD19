module uartToProcessorComp
import DataTypes::*;
(
input bit_t processor_clk,
input bit_t reset,
input ADDR_W w_add,
input ADDR_W r_add,
output  bit_t comp_empty
);

ADDR_W bin2grayToFF_wire;
ADDR_W FFToGray2bin_wire;
ADDR_W gray2binToComp_wire;

binToGray bin2gray
(
.bin (w_add),
.gray (bin2grayToFF_wire)
);

dualFF FF1
(
.clk (processor_clk),
.reset (reset),
.D (bin2grayToFF_wire),
.Q (FFToGray2bin_wire)
);

grayToBin gray2bin
(
.gray (FFToGray2bin_wire),
.bin (gray2binToComp_wire)
);

Comparator comp1
(
.value (r_add),
.compare_value (gray2binToComp_wire),
.compare_flag (comp_empty)
);


endmodule