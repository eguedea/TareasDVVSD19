module freqdiv
import ControlRx_in::*; 
(
	input One_t clk,
	input One_t reset,
	output One_t div
);

uartCounterDataType counter;

always_ff@(posedge clk)
begin
 if(!reset)
 begin
	div <= '0;
	counter <= '0;
 end
 else
	 begin
	 counter <= counter + 1;
	 if(counter==((bit_timing/2)-1))
	 begin
	  counter <= '0;
	  div <= !div;
	 end
 end
end
endmodule 