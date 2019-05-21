
timeunit 1ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

module FIFO1_TB;

	// Parameter Declarations
parameter word_length = 32;
parameter address_width = 16;
//parameter NBITS_FOR_COUNTER = CeilLog2(ADDR_WIDTH);

// Input Ports
bit clk;
bit rst;
bit Pop;
bit Push;
bit [word_length-1:0] DataIn;

// Output Ports
bit [word_length-1:0] DataOut;



/********************* Device Under Verification **************/
FIFO1

#(
	// Parameter Declarations
	.word_length(word_length),
	.address_width(address_width)
	//.NBITS_FOR_COUNTER(NBITS_FOR_COUNTER)
)
DUV
(
	// Input Ports
	.clk(clk),
	.rst(rst),
	.Pop(Pop),
	.Push(Push),
	.DataIn(DataIn),

	// Output Ports
	//.full(full),
	//.empty(empty),
	.DataOut(DataOut)
);

/**************************************************************************/
	
/******************** Stimulus *************************/
initial // Clock generator
  begin
    clk = 1'b0;
    forever #2 clk = !clk;
  end
/*----------------------------------------------------------------------------------------*/
initial begin /*Reset*/
	# 0 rst = 1'b0;
	#3 rst = 1'b1;
end
/*----------------------------------------------------------------------------------------*/
initial begin 
	# 0 Pop  = 1'b0;
	# 80 Pop  = 1'b1;
	# 4 Pop  = 1'b1;
	# 4 Pop  = 1'b1;
	# 4 Pop  = 1'b1;
	# 4 Pop  = 1'b0;
	# 4 Pop  = 1'b1;
	# 4 Pop  = 1'b0;
	# 4 Pop  = 1'b1;
	# 4 Pop  = 1'b0;
	# 4 Pop  = 1'b1;
	# 4 Pop  = 1'b0;
	# 4 Pop  = 1'b1;
	# 4 Pop  = 1'b0;
end 
/*----------------------------------------------------------------------------------------*/
initial begin 
	# 0  Push = 0;
	# 10  Push = 1'b1;
	# 4  Push = 1'b1;
	# 4  Push = 1'b1;
	# 4  Push = 1'b1;
	# 4  Push = 0;
	# 4  Push = 1'b1;
	# 4  Push = 0;
	# 4  Push = 1'b1;
	# 4  Push = 0;
	# 4  Push = 1'b1;
	# 4  Push = 0;
	# 4  Push = 1'b1;
	# 4  Push = 0;
end
/*----------------------------------------------------------------------------------------*/ 
initial begin
	# 0  DataIn = 1'b0;
	# 8  DataIn = 8;
	# 4  DataIn = 7;
	# 4  DataIn = 6;
	# 4  DataIn = 5;
	# 4  DataIn = 0;
	# 4  DataIn = 4;
	# 4  DataIn = 0;
	# 4  DataIn = 3;
	# 4  DataIn = 0;
	# 4  DataIn = 2;
	# 4  DataIn = 0;
	# 4  DataIn = 1;
end


/*--------------------------------------------------------------------*/

//     function integer CeilLog2;
//       input integer DataIn;
//       integer i,result;
//       begin
//          for(i=0; 2**i < DataIn; i=i+1)
//             result = i + 1;
//          CeilLog2 = result;
//       end
//    endfunction


endmodule
 
 