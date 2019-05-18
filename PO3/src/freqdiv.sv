module freqdiv
import DataTypes::*;
(
input bit_t clk,
input bit_t reset,
output bit_t div
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

//assign div = (bit_timing/2)?1'b0:1'b1;

endmodule