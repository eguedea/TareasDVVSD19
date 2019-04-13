module restador #(
parameter DW = 16,
parameter DW_2 = 8

) (
input logic [DW-1:0] A,
input logic [DW-1:0] B,
output logic [DW-1:0] Out
);

always_comb begin

Out = A - B;

end

endmodule