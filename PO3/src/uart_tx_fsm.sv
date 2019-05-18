module uart_tx_fsm
import DataTypes::*;

(
	input bit_t clk,
	input bit_t reset,
	input bit_t start,
	input bit_t next_bit,
	input bit_t bit_counter,
	
	output bit_t reset_timer,
	output bit_t increment_bit_counter,
	output bit_t reset_bit_counter,
	output bit_t shift_reg,
	output bit_t load_reg,
	output bit_t busy,
	output bit_t idle_line
	
);

TX_STATE txstates;

always_ff@(posedge clk or negedge reset) 
begin
	if(reset == 0)
		txstates <= IDLE;
	else
	begin
		case(txstates)
			IDLE: begin
				if(!start)
					txstates <= IDLE;
				if(start)
					txstates <= SETUP;
			
			end
			SETUP: begin
				txstates <= COUNT;
			end
			COUNT: begin
			  //if(bit_counter)
				//	txstates <= IDLE;
				if(next_bit)
					txstates <= SHIFT;
				
			
			end
			SHIFT: begin
				if(bit_counter)
					txstates <= IDLE;
				else
					txstates <= COUNT;
			end
			WAIT: begin
				if(!start)
					txstates <= IDLE;
				
			
			end		
		endcase	
	end
end

always_comb begin
		  reset_timer = '1;
		  increment_bit_counter = '0;
		  reset_bit_counter = '0;
		  shift_reg = '0;
		  load_reg = '0;
		  busy = '0;
		  idle_line = '0;
	case(txstates) 
		IDLE:begin
		  reset_timer = '1;
		  increment_bit_counter = '0;
		  reset_bit_counter = '1;
		  shift_reg = '0;
		  load_reg = '0;
		  busy = '0;
		  idle_line = '1;
		end
		SETUP: begin
		  reset_timer = '1;
		  increment_bit_counter = '0;
		  reset_bit_counter = '1;
		  shift_reg = '0;
		  load_reg = '1;
		  busy = '1;
		  idle_line = '1;

		end
		COUNT: begin
		  reset_timer = '0;
		  increment_bit_counter = '0;
		  reset_bit_counter = '0;
		  shift_reg = '0;
		  load_reg = '0;
		  busy = '1;
			idle_line = '0;
			
		
		end
		SHIFT: begin
		  reset_timer = '1;
		  increment_bit_counter = '1;
		  reset_bit_counter = '0;
		  shift_reg = '1;
		  load_reg = '0;
		  busy = '1;
			idle_line = '0;
		end
		WAIT: begin
		  reset_timer = '0;
		  increment_bit_counter = '0;
		  reset_bit_counter = '0;
		  shift_reg = '0;
		  load_reg = '0;
		  busy = '0;
		  idle_line = '1;
		
		end
		default: begin
		  reset_timer = '0;
		  increment_bit_counter = '0;
		  reset_bit_counter = '0;
		  shift_reg = '0;
		  load_reg = '0;
		  busy = '0;	
		  idle_line = '1;
		end
	
	endcase
end


endmodule