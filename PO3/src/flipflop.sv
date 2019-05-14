module flipflop
import DataTypes::*;
(
input bit_t clk,
input bit_t reset,
input ADDR_W D,
output ADDR_W Q
);

always_ff@(posedge clk or negedge reset)
begin
	if(!reset)
		Q <= '0;
	else
		Q <= D;
end

endmodule