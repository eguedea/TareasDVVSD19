module StateMachine_Processor
import ControlRx_in::*; 
(
	input clk,
	input reset,
	input DataIn_t	Size_Matriz,
	input One_t Cnt_P1,			// flag para decir que termino el procesador 
	input One_t Cnt_P2,
	input One_t Cnt_P3,
	input One_t Cnt_P4, 
	input One_t enable_Data,
	
	output DataIn_t Cntrl_P1,Cntrl_P2,Cntrl_P3,Cntrl_P4, // para controlar el MuXX de procesador de la ram 
	output One_t Enable_FIFO_DualClk,FIFO_POP,Activa_FIFO,		/// habilita la FIFO
	output One_t Flag_P1,Flag_P2,Flag_P3,Flag_P4
);

DataIn_t Counter_FIFO;


StatePrecessor_t State;
always_ff @(posedge clk  or negedge reset) begin:Processor
	if(!reset)begin
		State <= Iddle;
					Flag_P1 <= '0;
					Flag_P2 <= '0;
					Flag_P3 <= '0;
					Flag_P4 <= '0;
					Cntrl_P1 <= '0;
					Cntrl_P2 <= '0;
					Cntrl_P3 <= '0;
					Cntrl_P4 <= '0;
					Activa_FIFO <= '0;
					Counter_FIFO <= '0;
					FIFO_POP <= 0;
	end
	else begin   
	
		 case(State)
			Iddle: begin 

					if(enable_Data)
						State <= Processor_1;
					else 
						State <= Iddle;
			end 
			
			Processor_1:begin 
				if((1 <= Size_Matriz) && (Flag_P1 == 0))begin
					Cntrl_P1 <= 0;
					Flag_P1 <= 1;
					if(Size_Matriz == 1)	
						State <= FIFO;
					else	
						State <= Processor_2;
				end
				else begin
					if (Size_Matriz >= 5 && (Cnt_P1==1))begin
						Cntrl_P1 <= 4;
						FIFO_POP <= 1;
						if((Size_Matriz%4) == 1)	
							State <= FIFO;
						else 
							State <= Processor_2;
					end
				end
			
			end
			Processor_2:begin 
				if((2 <= Size_Matriz) && (Flag_P2 == 0))begin
					Cntrl_P2 <= 1;
					Flag_P2 <= 1;
					if(Size_Matriz == 2)
						State <= FIFO;
					else
						State <= Processor_3;
				end
				else 
				if (Size_Matriz >= 6 && (Cnt_P2==1))begin
					Cntrl_P2 <= 5;
					if((Size_Matriz%4) == 2)
						State <= FIFO;
					else
						State <= Processor_3;
				end
			end
			Processor_3:begin 
				if((3 <= Size_Matriz) && (Flag_P3 == 0))begin
					Cntrl_P3 <= 2;
					Flag_P3 <= 1;
					if(Size_Matriz == 3)
						State <= FIFO;
					else
						State <= Processor_4;
				end
				else 
				if (Size_Matriz >= 7 && (Cnt_P3==1))begin
					Cntrl_P3 <= 6;
					if((Size_Matriz%4) == 3)
						State <= FIFO;
					else
						State <= Processor_4;
				end
			end
			
			Processor_4:begin 
				if((4 <= Size_Matriz) && (Flag_P4 == 0))begin
					Cntrl_P4 <= 3;
					Activa_FIFO <= 1;
					Flag_P4 <= 1;
					if(Size_Matriz == 4)
						State <= FIFO;
					else
						State <= Processor_1;
				end
				else 
				if (Size_Matriz >= 8 && (Cnt_P4==1))begin
					Cntrl_P4 <= 7;
					Activa_FIFO <= 0;
					if((Size_Matriz%4) == 4)
						State <= FIFO;
					else
						State <= Processor_1;
				end
			end
			
			FIFO : begin 
				if(Counter_FIFO <= Size_Matriz)begin
					Counter_FIFO++;
					Enable_FIFO_DualClk <= 1;
				end
				else begin
					Enable_FIFO_DualClk <= 0;
					State <= Iddle;

				end
			
			end 
			default: begin 
					State <= Iddle;
			end
		 
		 endcase 
	end 
	
end:Processor

endmodule
