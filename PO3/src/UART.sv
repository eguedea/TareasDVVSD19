 ///*synthesis keep*/
module UART
import UART_pkg::*; 
(
	input  clk,
	input  reset,
	input  serial_rx,
	
	output int8_t received_data
	//output int8_t DataOutPrueba

	
	//output clk_PLL
);

	
//wire clkInter/*synthesis keep*/; 
//
//ClockGeneratorUart	ClockGenerator_inst (
//	.areset ( !reset ),
//	.inclk0 ( clk ),
//	.c0 ( clkInter )
//);
//
//assign clk_PLL = clkInter;

One_t enable_interrupt_wire,Enable_Processsors,clk_1k;
int8_t received_data_wire,Size_Matriz,Count_i;
One_t Longitud_Trama,Longitud_Matriz,SaveData_Matriz,SaveData_Vector;

Matriz_U Matriz_Out;
Vector_U Vector_Out;

UART_RX
Receiver
(
	.serial_rx(serial_rx),
	.clk(clk),
	.reset(reset),
	
	.received_data(received_data_wire),
	.enable_interrupt(enable_interrupt_wire)
);

StateMachine_Rx_in
Cnt_in
(
	.clk(clk),
	.reset(reset),
	.DataReady_Rx(enable_interrupt_wire),
	.DataRecive_Rx(received_data_wire),
	.L_Matriz(Size_Matriz),
	
	.Longitud_Trama(Longitud_Trama),
	.Longitud_Matriz(Longitud_Matriz),
	.SaveData_Matriz(SaveData_Matriz),
	.SaveData_Vector(SaveData_Vector),
	.Count_i(Count_i)

);

RAM_RxIn
SaveDatos
(
	.clk(clk),
	.reset(reset),
	.DataRecived(received_data_wire),
	.Count_i(Count_i),
	.enable_interrupt_wire(enable_interrupt_wire),
	
	.Cntr_Trama(Longitud_Trama),
	.Cntr_Lng_Matriz(Longitud_Matriz), 
	.Cntr_Save_Mz(SaveData_Matriz),
	.Cntr_Save_Vr(SaveData_Vector),
	
	.Size_Matriz(Size_Matriz),
	.Vector_Out(Vector_Out),
	.Matriz_Out(Matriz_Out),
	.Enable_Processsors(Enable_Processsors)
);
freqdiv divisor 
(
	.clk(clk),
	.reset(reset),
	
	.div(clk_1k)
);

Processor_Top Top_Procesor
(
	.clk(clk_1k),
	.reset(reset), 
	.Size_Matriz(Size_Matriz),
 	.Matriz(Matriz_Out),
 	.Vector(Vector_Out),
	.enable_Data(Enable_Processsors) //falta
);

assign  received_data = received_data_wire;

endmodule
	