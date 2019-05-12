module Operation 
#(
parameter DW = 4
)
(
// Input Ports
input clk,
input reset,
input start,
input [1:0] Q_0,

// Output Ports
output logic [1:0] Qm
);

always_comb 
begin 
	case(Q_0)
	0: Qm = 0;
	1: Qm = 1;
	2: Qm = 2;
	3: Qm = 0;
	default: Qm = 0;
	endcase
end

endmodule 