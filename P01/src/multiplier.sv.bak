module multiplier #(
parameter DW = 4
) (
	input 		   clk,
	input				rst,
	input				start,
	input logic [DW-1:0] multiplicand,
	input logic [DW-1:0] multipliers,
	output			ready,
	output logic [(DW*2)-1:0] product
);
/*
logic [DW-1:0] A = '0;
logic [DW-1:0] Q = '0;
logic Qm = '0;
logic [DW-1:0] N = DW;
logic [1:0] condition = 0;
logic [(DW*2):0] datashift;

assign Q = multipliers;

//logic [(DW*2):0] data = {A,Q,Qm};


always_ff@(posedge clk or negedge rst) begin: Multiplication
	if(!rst)
		product  <= '0;
	else if(start) begin: Booth
		condition <= data[1:0];
		case(condition)
			2'b00: begin
				datashift <= data>>1;
				data <= {data[(DW*2)],datashift[(DW*2):1]};
				N <= N-1;
				end
		
		endcase
		
		
	end: Booth

end: Multiplication

*/
endmodule

