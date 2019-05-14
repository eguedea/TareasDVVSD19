module dualFF
import DataTypes::*;
(
input bit_t clk,
input bit_t reset,
input ADDR_W D,
output ADDR_W Q
);

ADDR_W Q1_wire;
ADDR_W Q2_wire;

always_ff@(posedge clk or negedge reset)
begin
	if(!reset)
	begin
		Q <= '0;
	end
	else
	begin
	 Q <= Q2_wire;

	end
end

flipflop ff1
(
.clk (clk),
.reset (reset),
.D (D),
.Q (Q1_wire)
);

flipflop ff2
(
.clk (clk),
.reset (reset),
.D (Q1_wire),
.Q (Q2_wire)
);

endmodule