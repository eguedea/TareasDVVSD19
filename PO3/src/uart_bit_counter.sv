module uart_bit_counter
import DataTypes::*;
(
input bit_t clk,
input bit_t reset,
input bit_t increment_bit_counter,
input bit_t reset_bit_counter,
output bit_t bit_counter

);

uartBitsAmountCounter counter = '0;

always_ff@(posedge clk or negedge reset)
begin
	if(!reset)
	begin
		counter <= '0;
		bit_counter <= '0;
	end
	else
	begin
	   if(reset_bit_counter)
			bit_counter <= '0;
		else if(counter == bitspertx-1)
		begin	
			bit_counter <= '1;
			counter <= '0;
		end
		else if(increment_bit_counter)
			counter <= counter + 1;
	end
end


endmodule