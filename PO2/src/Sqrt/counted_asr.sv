module counted_asr #(
parameter DW = 16,
parameter DW_2 = 8
) (
input logic [DW-1:0] D,
input logic [DW_2-1:0] R,
input logic [DW-1:0]excounter,
output logic [DW-1:0] out
);

//internal wires
logic [DW-1:0] AndTooOrCable;
always@(excounter) begin

  AndTooOrCable = (D >> (16'h2000>>excounter)) & {{DW-2{1'b0}},2'b11};
  out = AndTooOrCable | (R << 2);

end

endmodule