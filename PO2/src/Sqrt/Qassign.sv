module Qassign #(
parameter DW = 16,
parameter DW_2 = 8
) (
input logic [DW_2-1:0] Rresult,
input logic [DW_2-1:0] Q,
output logic [DW_2-1:0] Qout

);


always@(Rresult) begin

	if(Rresult >= 0)
		Qout = (Q << 1) | 1;
	else
		Qout = (Q << 1) | 0;
end


endmodule