module BinaryCounter
#(
	// Parameter Declarations
	parameter NBITS_FOR_COUNTER = 4
)

(
	// Input Ports
	input clk,
	input reset,
	input enable,
	
	// Output Ports
	output[NBITS_FOR_COUNTER-1:0] CountOut 

);


logic [NBITS_FOR_COUNTER-1 : 0] Count_logic;

	always_ff@(posedge clk or negedge reset) begin: ThisIsACounter
		if (reset == 1'b0)
			Count_logic <= {NBITS_FOR_COUNTER{1'b0}};
		else
			if(enable == 1'b1)
					Count_logic <= Count_logic + 1'b1;
	end: ThisIsACounter

//----------------------------------------------------
assign CountOut = Count_logic;
//----------------------------------------------------

endmodule