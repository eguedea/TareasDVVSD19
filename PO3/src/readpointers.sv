module readpointers
import DataTypes::*;
(
input bit_t clk,
input bit_t reset,
input bit_t pop,
output RAM_size r_add,
output bit_t r_en
);

RAM_size counter = '0;

always_ff@(posedge clk or negedge reset)
begin
	if(!reset)
	begin
		r_en = '0;
		counter = '0;
	end
	else
	begin
		if(pop)
		begin
			if(counter == maxramsize - 1)
			begin
				r_en = '1;
				counter = '0;
			end
			else
			begin
				r_en = '1;
				counter = counter + 1'b1;
			end
			
		end
		else
			r_en = '0;
	end
end

assign r_add = counter;

endmodule