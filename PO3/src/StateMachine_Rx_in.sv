module StateMachine_Rx_in
import ControlRx_in::*; 
(
	input clk,
	input reset,
	input DataReady_Rx,
	input DataIn_t DataRecive_Rx, 
	
	input DataIn_t L_Matriz,
	
	output One_t Longitud_Trama,
	output One_t Longitud_Matriz,
	output One_t SaveData_Matriz,
	output One_t SaveData_Vector,
	
	output DataIn_t Count_i
	

);


StateRxIn_t State;

DataIn_t Counter;


always_ff @(posedge clk  or negedge reset) begin:ControlRx
	if(!reset)begin
		Longitud_Trama <= 1'b0;
		Longitud_Matriz <= 1'b0;
		SaveData_Matriz <= 1'b0;
		SaveData_Vector <= 1'b0;
		Counter <= '0;
		
	end
	else 
	begin    
		 case(State)
				WAIT_UART: begin 
					if(DataReady_Rx)begin
						if(DataRecive_Rx == IniciaTrama)
							State <= INDEX_NUMBER;
						else
							State <= WAIT_UART;
					end
					else 
						State <= WAIT_UART;
				end
				
				INDEX_NUMBER: begin 
					if(DataReady_Rx)begin
						Longitud_Trama <= 1'b1;// bandera para tomar laa longitud de la trama
						State <= DATA_CMD;
					end
					else 
						State <= INDEX_NUMBER;
				end 
				
				DATA_CMD: begin 
					Longitud_Trama <= 1'b0;
					if(DataReady_Rx)begin
						if(DataRecive_Rx == SizeProduct)
							State <= LONGITUD_MATRIZ;
						else if(DataRecive_Rx == StartTransmision)
							State <= FINAL_TRAMA;
						else if(DataRecive_Rx == MatrizData)begin
							SaveData_Matriz <= 1'b1;
							State <= DATA_MATRIZ;
						end
						else if(DataRecive_Rx == VectorData)begin
							SaveData_Vector <= 1'b1;
							State <= DATA_VECTOR;
						end
					end
					else 
						State <= DATA_CMD;
				end
				
				LONGITUD_MATRIZ: begin 
					if(DataReady_Rx)begin
						Longitud_Matriz <= 1'b1;		//bandera para tomar la longitud de la matriz
						State <= FINAL_TRAMA;
					end
					else 
						State <= LONGITUD_MATRIZ;
				end
						
				DATA_MATRIZ: begin 
					if(DataReady_Rx)begin
						if(Counter <= ((L_Matriz*L_Matriz)-1))begin
							SaveData_Matriz <= 1'b1;	// bandera para guardar los datos de la matriz en la ram
							Counter++;
							if(Counter == (L_Matriz*L_Matriz))begin
								SaveData_Matriz <= 1'b0;
								Counter <= '0;
								State <= FINAL_TRAMA;
							end
						end
						else 
							State <= FINAL_TRAMA;
					end
					else 
						State <= DATA_MATRIZ;
				end 

				DATA_VECTOR: begin 
					if(DataReady_Rx)begin
						if(Counter <= (L_Matriz-1))begin
							SaveData_Vector <= 1'b1;	//bandera para guardar los datos del vector en la ram
							Counter++;
							if(Counter == L_Matriz)begin
								SaveData_Vector <= 1'b0;
								Counter <= '0;
								State <= FINAL_TRAMA;
							end
						end
						else 
							State <= FINAL_TRAMA;
					end
					else 
						State <= DATA_VECTOR;
				end 
				
	
				FINAL_TRAMA: begin 
					Longitud_Matriz <= 1'b0;
					if(DataReady_Rx)begin
						if(DataRecive_Rx == TerminaTrama)begin 
							Counter <= '0;							//limpiamos contador
							State <= WAIT_UART;
						end
						else begin
							State <= WAIT_UART;					
						end
					end
					else 
						State <= FINAL_TRAMA;
				end
				
				default: 
					State <= WAIT_UART;
		endcase
	end
		
end:ControlRx

assign Count_i = Counter;

endmodule 