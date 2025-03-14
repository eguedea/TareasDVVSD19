module uart_timer
import DataTypes::*;

(
	input bit_t clk,
	input bit_t reset,
	input bit_t reset_timer,
	output bit_t next_bit
);
uartCounterDataType counter = '0;


always_ff@(posedge clk or negedge reset) begin
	if(!reset) 
	begin
		next_bit <= '0;
		counter <= '0;
	end
	else 
	begin
		if(!reset_timer) 
		begin
			if(counter == bit_timing)
				next_bit <= 1;
			else
				counter <= counter + 1;
		end
		else
		begin
			next_bit <= '0;
			counter <= '0;
		end
	end


end






endmodule
