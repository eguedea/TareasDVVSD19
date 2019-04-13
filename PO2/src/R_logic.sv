module R_logic #(
parameter DW = 16,
parameter DW_2 = 8

) (
input logic [DW_2-1:0] R,
input logic [DW_2-1:0] ASRin,
output logic [DW_2-1:0] OroutQ

);

 assign OroutQ = ((ASRin & {{DW_2-2{1'b0}},2'b11}) | (R << 2));
 


endmodule