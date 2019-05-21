module RAM_RxIn
import ControlRx_in::*; 
(
	input clk,
	input reset,
	input DataIn_t DataRecived,
	input DataIn_t Count_i,
	input One_t enable_interrupt_wire,
	input One_t Cntr_Trama,
	input One_t Cntr_Lng_Matriz, 
	input One_t Cntr_Save_Mz,
	input One_t Cntr_Save_Vr,
	
	
	output DataIn_t Size_Matriz,
	output Matriz_t Matriz_Out,
	output Vector_t Vector_Out,
	output One_t Enable_Processsors
);

Matriz_t Matriz;
Vector_t Vector;
DataIn_t count;
One_t Enable,Aux;
RxIn_t Rx_t;
always_ff @(posedge clk  or negedge reset) begin:Ram
	if(!reset)begin
		Rx_t.L_Trama <= '0;
		Rx_t.L_Matriz <= '0;
		Rx_t.M_Cuadrada <= '0;
		count <= 0;
		Enable <=0;
		Aux <= 0;
	end
	else 
	begin
		if(Cntr_Trama)begin
			Rx_t.L_Trama <= DataRecived;
		end
		else if(Cntr_Lng_Matriz)begin 
			Rx_t.L_Matriz <= DataRecived;
			Rx_t.M_Cuadrada <= DataRecived*DataRecived;
		end
		else if(Cntr_Save_Mz&enable_interrupt_wire)begin 
			Matriz[Count_i] = DataRecived;
		end
		else if(Cntr_Save_Vr&enable_interrupt_wire)begin 
			Vector[Count_i] = DataRecived;
			count++;
			Aux <= 1;
		end	
		else if((count == Rx_t.L_Matriz)&&Aux)begin
			count <= 0;
			Enable <= 1;
		end
////		else if(count==0) begin
////			Enable <= 0;
////			Aux <= 0;
////		end
	end
	
	
end:Ram

assign Size_Matriz = Rx_t.L_Matriz;
assign Matriz_Out = Matriz;
assign Vector_Out = Vector;
assign Enable_Processsors = Enable;
endmodule 