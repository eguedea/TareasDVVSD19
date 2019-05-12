module control_mod #(
parameter DW = 16,
parameter DW_2 = 8

) (
input logic [DW_2-1:0] R,
output logic control
);

always_comb begin
	if(R>=0)
		control = 1;
	else
		control = 0;
end

endmodule

