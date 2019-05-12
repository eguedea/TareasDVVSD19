module piso_msb #(
parameter DW = 9
) (
input logic              clk,    // Clock
input logic              reset,    // asynchronous reset low active 
input logic              enb,    // Enable
input logic              load,    // load or shift
input	logic				  shift,
input logic [DW-1:0]     inp,    // data input
output logic             out     // Serial output
);

logic [DW-1:0]      rgstr_r;

always_ff@(posedge clk or negedge reset) begin: rgstr_label
    if(!reset)
        rgstr_r  <= '1;
    else if (enb) begin
        if (load)
            rgstr_r  <= inp;
        else if(shift)
            rgstr_r  <= {rgstr_r[DW-2:0], rgstr_r[DW-1]};
    end
end:rgstr_label

assign out  = rgstr_r[DW-1];    // MSB bit is the first to leave
//TODO: try to design a piso register, where the LSB bit leave the register first and then the LSB bit+1.
endmodule
