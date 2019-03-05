module debouncer(
    input logic in,
    input clk,
    input rst,
    output logic out
    );
	 
	 always_ff@(posedge clk or negedge rst) begin: debouncer
	  if(!rst)
		out  <= '0;
	  else
		out <= in;
	 
	 end: debouncer
	   
endmodule