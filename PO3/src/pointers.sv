module pointers
import DataTypes::*;
(
input bit_t clk,
input bit_t reset,
input bit_t push,
output RAM_size w_add,
output bit_t w_en
);

RAM_size counter;

always_ff@(posedge clk or negedge reset)
begin
	if(!reset)
	begin
		w_en = '0;
		counter = '0;
	end
	else
	begin
		if(push)
		begin
			if(counter == maxramsize-1)
			begin
				w_en = '1;
				counter = '0;
			end
			else
			begin
				w_en = '1;
				counter = counter + 1;
			end
		end
		else
			w_en = '0;
	end
end

assign w_add = counter;

endmodule