
module UART_RX
import UART_pkg::*; 
(
input  One_t serial_rx,
input   clk,
input   reset,

output int8_t received_data,
output One_t  enable_interrupt
);

One_t		 enable_count,enable_count_wait,countFinished,countFinished_Wait,Enable_b,countF_b;
One_t 	 Dato_Ready;

state_t state;

CounterParameter_RX
#(.Maximum_Value(CounterWait))
Contador_Wait
(
	.clk(clk),
	.reset(reset),
	.enable(enable_count_wait),
	
	.Flag(countFinished_Wait)
);

CounterParameter
#(.Maximum_Value(CounterFin))
Contador_BIT
(
	.clk(clk),
	.reset(reset),
	.enable(enable_count),
	
	.Flag(countFinished)
);

CounterParameter
#(.Maximum_Value(CounterFull))
Contador_B
(
	.clk(clk),
	.reset(reset),
	.enable(Enable_b),
	
	.Flag(countF_b)
);

sipo 
Register_RX
(
	.clk(clk),
	.rst(reset),
	.enb((countFinished_Wait|countF_b)&enable_count),
	.CounFin(enable_count_wait),
	.inp(serial_rx),
	.out(received_data)


);
always_ff @(posedge clk, negedge reset)
	begin
		if(reset==0)
			begin
				state <= IDLE;
			end
		else
			begin
			case(state)
			IDLE:
				if(serial_rx == 1'b1)
					state <= IDLE;	
				else
					state <= WAIT;
			WAIT:			////wait
				if(countFinished_Wait==1'b1)
				begin
					state <= RECIVE;	//Toma el primer dato
					Enable_b <= 1'b1;
				end
				else 
					state <= WAIT;
					
			RECIVE: 
				if(countFinished == 1'b1) // Toma 7 Datos
					state <= PARITY;	
				else
					state <= RECIVE;
					
			PARITY:
				if(countFinished_Wait==1'b1)
					begin
						state <= READY; //Toma el bit de paridad 
						Enable_b <= 1'b0;
					end
				else
					state <= PARITY;	
					
			READY:
					state <= IDLE;	// Tiene el dato listo
				
			default:
					state <= IDLE;	
			endcase
			end
	end
always_comb begin
	
	enable_count = 1'b0;
	enable_count_wait = 1'b0;
	Dato_Ready = 1'b0;
	case(state)
		IDLE:
			begin
				enable_count = 1'b0;
				enable_count_wait = 1'b0;
				Dato_Ready = 1'b0;
			end
		WAIT:
			begin
				enable_count = 1'b0;
				enable_count_wait = 1'b1;
				Dato_Ready = 1'b0;
			end
		RECIVE:
			begin
				enable_count = 1'b1;
				enable_count_wait = 1'b0;
				Dato_Ready = 1'b0;
			end
		PARITY:
			begin
				enable_count = 1'b0;
				enable_count_wait = 1'b1;
				Dato_Ready = 1'b0;
			end
		READY:
			begin
				enable_count = 1'b0;
				enable_count_wait = 1'b0;
				Dato_Ready = 1'b1;
			end
		default:
			begin
				enable_count = 1'b0;
				enable_count_wait = 1'b0;
				Dato_Ready = 1'b0;
			end
		
	endcase
end
assign enable_interrupt = Dato_Ready;
endmodule

