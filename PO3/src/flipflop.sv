module flipflop
import DataTypes::*;
(
input bit_t clk,
input bit_t reset,
input bit_t D,
output bit_t Q
);

always_ff@(posedge clk)
begin
	Q <= D;
end

endmodule