module Division_Top
import Global::*;
(
	input 		   clk,
	input				rst,
	input				start,
	input logic [DW-1:0] Dividendo,
	input logic [DW-1:0] Divisor,//M
	
	
	output			ready,
	output logic [DW-1:0] Cosiente,
	output logic [DW-1:0] Residuo
	//output clk_PLL
);

wire cont_flag_Wire;
wire enable_cont_wire;
wire enable_Operation_wire;
wire enable_sync_rst_wire;
wire ready_wire_flag;



//Sumador Restador

wire logic [DW-1:0]Wire_Qm;
wire logic [DW-1:0]A_Resta;
wire logic [DW-1:0]R_Suma;
wire logic Op_Aux_resta;

StateMachine
Unidad_Control(
	.clk(clk),
	.reset(rst),
	.count_flag(cont_flag_Wire),
	.start(start), // iniciar en idle
	.count_wire(enable_cont_wire),//comenzar a contar ciclos
	.sync_reset(enable_sync_rst_wire), //limpiar registros
	.ready_wire(ready_wire_flag), 
	.Operation(enable_Operation_wire)
);

Counter
Modulo_Contador
(
	.clk(clk),
	.reset(rst),
	.enable(enable_cont_wire), //Viene de la maquina de estados
	.sync_reset(enable_sync_rst_wire),
	.SM_flag(cont_flag_Wire) //Salida hacia la entrada de sm
);

Division
Modulo_div
(
	.clk(clk),
	.reset(rst),
	.load(enable_Operation_wire),
	.ready(ready_wire_flag),
	.Dividendo(Dividendo),
	.Cosiente(Cosiente),
	.Wire_Qm(Wire_Qm),
	.R_Suma(R_Suma),
	
	.Residuo(Residuo),
	.A_Resta(A_Resta),
	.Op_Aux_resta(Op_Aux_resta)
);

Resta Resta
(
	.A(A_Resta),
	.B(Divisor),
	.Aux(Op_Aux_resta),
	.P(Wire_Qm)

);

Suma Suma
(
	.A(Wire_Qm),
	.B(Divisor),

	.P(R_Suma)
);


endmodule 
