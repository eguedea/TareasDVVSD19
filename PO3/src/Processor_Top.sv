module Processor_Top
import ControlRx_in::*; 
(
 input clk,
 input reset, 
 input DataIn_t Size_Matriz,
 input Matriz_t Matriz,
 input Vector_t Vector,
 input One_t enable_Data //falta


);
DataIn_t Acomulador_P0,Acomulador_P1,Acomulador_P2,Acomulador_P3, OutAcomulador,Out_FIFO,P;
DataIn_t Cntrl_P1,Cntrl_P2,Cntrl_P3,Cntrl_P4;
One_t Cnt_P0,Cnt_P1,Cnt_P2,Cnt_P3,Activa_FIFO,FIFO_POP,Flag_P1,Flag_P2,Flag_P3,Flag_P4,Enable_FIFO_DualClk;

muxAcomulador_P0 MuxP0
(
	.N_Procesador(Cntrl_P1),
	.Dato_In(Out_FIFO),
	
	.Dato_Out(OutAcomulador)
);




StateMachine_Processor Control_Processor
(
	.clk(clk),
	.reset(reset),
	.Size_Matriz(Size_Matriz),
	.Cnt_P1(Cnt_P0),
	.Cnt_P2(Cnt_P1),
	.Cnt_P3(Cnt_P2),
	.Cnt_P4(Cnt_P3),
	.enable_Data(enable_Data),
	
	.Activa_FIFO(Activa_FIFO),
	.FIFO_POP(FIFO_POP),
	.Cntrl_P1(Cntrl_P1),
	.Cntrl_P2(Cntrl_P2),
	.Cntrl_P3(Cntrl_P3),
	.Cntrl_P4(Cntrl_P4),
	.Flag_P1(Flag_P1),
	.Flag_P2(Flag_P2),
	.Flag_P3(Flag_P3),
	.Flag_P4(Flag_P4),
	.Enable_FIFO_DualClk(Enable_FIFO_DualClk)


);

Processor P0
(
	.clk(clk),
	.reset(reset), 
	.enable(Flag_P1),
	.size(Size_Matriz),
	.Matriz(Matriz),
	.Cntrl_P(Cntrl_P1),
	.Vector(Vector[Cntrl_P1]),
	.Acomulador(OutAcomulador),
	
	.Out_P(Acomulador_P0),
	.Cnt_P(Cnt_P0)

);

Processor P1
(
	.clk(clk),
	.reset(reset), 
	.enable(Flag_P2),
	.size(Size_Matriz),
	.Matriz(Matriz),
	.Cntrl_P(Cntrl_P2),
	.Vector(Vector[Cntrl_P2]),
	.Acomulador(Acomulador_P0),
	
	.Out_P(Acomulador_P1),
	.Cnt_P(Cnt_P1)

);
Processor P2
(
	.clk(clk),
	.reset(reset), 
	.enable(Flag_P3),
	.size(Size_Matriz),
	.Matriz(Matriz),
	.Cntrl_P(Cntrl_P3),
	.Vector(Vector[Cntrl_P3]),
	.Acomulador(Acomulador_P1),
	
	.Out_P(Acomulador_P2),
	.Cnt_P(Cnt_P2)

);
Processor P3
(
	.clk(clk),
	.reset(reset), 
	.enable(Flag_P4),
	.size(Size_Matriz),
	.Matriz(Matriz),
	.Cntrl_P(Cntrl_P4),
	.Vector(Vector[Cntrl_P4]),
	.Acomulador(Acomulador_P2),
	
	.Out_P(Acomulador_P3),
	.Cnt_P(Cnt_P3)

);

FIFO1 
#(
.word_length(8), 
.address_width(16)
)
FIFO_P3
(
	.clk(clk),
	.rst(reset),
	.Push(Activa_FIFO),
	.Pop(FIFO_POP),
	.DataIn(Acomulador_P3),
	.DataOut(Out_FIFO)
);

muxSalidas salidas
(
	.P0(Acomulador_P0),
	.P1(Acomulador_P1),
	.P2(Acomulador_P2),
	.P3(Acomulador_P3),
	.size(Size_Matriz), 
	
	.P(P)
	
);


endmodule 

