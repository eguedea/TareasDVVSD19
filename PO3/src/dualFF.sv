module dualFF
import DataTypes::*;
(
input bit_t clk,
input bit_t reset,
input bit_t D,
output bit_t Q
);

bit_t Q1_wire;
bit_t Q2_wire;

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