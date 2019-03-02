`timescale 1ns/1ps

module stateMachine_TB;

 // Input Ports
reg clk = 0;
reg reset;
reg start;

// Output Ports 
logic out;
logic hzClk;
 

Top
DUT
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.start(start),

	
	// Output Ports
	.out(out),
	.hzClk(hzClk)
);	

/*********************************************************/
initial // Clock generator
  begin
    forever #10 clk = !clk;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset = 0;
	#50 reset = 1;
end

/*********************************************************/
initial begin // enable
	#60 start = 1;
end/*********************************************************/


endmodule