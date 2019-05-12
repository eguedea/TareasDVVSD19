//Nombre: Multiplicador
//Descripcion: Top del modulo donde succeden todas las instanciaciones
//Entrada:Clk, rst, start, sync_reset, multiplicand y multipliers
//Salida: ready y product
//Autor: Alberto Contreras, Eric Guedea Osuna
//Fecha: 11 de marzo del 2019


module Multiplicador_PLL
import Global::*;
(
	input 		   clk,
	input				rst,
	input				start,
	input logic [DW-1:0] multiplicand,
	input logic [DW-1:0] multipliers,
	
	
	output			ready,
	output logic [(DW*2)-1:0] product,
	output logic [(DW*2)-1:0] ProductoFinal,
	output clk_PLL
);


wire cont_flag_Wire;
wire enable_cont_wire;
wire enable_Operation_wire;
wire enable_sync_rst_wire;
wire [DW*2:0]Aux_Producto;
wire Start_Shot;
wire [DW-1:0]Multiplicand_PIPO_Out;
wire [DW-1:0]Multipliers_PIPO_Out;
wire clkInter/*synthesis keep*/;

wire ready_wire_flag;

// SumaResta Operaciones 

wire [DW-1:0] OperacionSuma;
wire [DW-1:0] OperacionResta;
wire [DW-1:0] Producto_Op;

ClockGenerator	ClockGenerator_inst (
	.areset ( !rst ),
	.inclk0 ( clk ),
	.c0 ( clkInter )
	);



assign clk_PLL = clkInter;

One_Shot
Start(
	.clk(clkInter),
	.reset(rst),
	.Start(start),
	
	.Shot(Start_Shot)
);

PIPO
PIPO_Multiplicand(
	.clk(clkInter),
	.rst(rst),
	.enb(Start_Shot),
	.inp(multiplicand),
	
	.out(Multiplicand_PIPO_Out)
);

PIPO
PIPO_Multiplier(
	.clk(clkInter),
	.rst(rst),
	.enb(Start_Shot),
	.inp(multipliers),
	
	.out(Multipliers_PIPO_Out)
);


StateMachine
Unidad_Control(
	.clk(clkInter),
	.reset(rst),
	.count_flag(cont_flag_Wire),
	.start(Start_Shot), // iniciar en idle
	.count_wire(enable_cont_wire),//comenzar a contar ciclos
	.sync_reset(enable_sync_rst_wire), //limpiar registros
	.ready_wire(ready_wire_flag), 
	.Operation(enable_Operation_wire)
);


Counter
Modulo_Contador
(
	.clk(clkInter),
	.reset(rst),
	.enable(enable_cont_wire), //Viene de la maquina de estados
	.sync_reset(enable_sync_rst_wire),
	.SM_flag(cont_flag_Wire) //Salida hacia la entrada de sm
);

Booth
Modulo_Multi
(
	.clk(clkInter),
	.reset(rst),
	.load(enable_Operation_wire),
	.ready(ready_wire_flag),
	.Multiplicand_in(Multiplicand_PIPO_Out),
	.OperacionResta(OperacionResta),
	.OperacionSuma(OperacionSuma),
	.Product_Aux({Aux_Producto[(DW*2)-1],Aux_Producto[(DW*2)-1:0]}),
	
	.Producto(Aux_Producto),
	.Producto_Op(Producto_Op)

);
Suma Suma(
	.A(Producto_Op),
	.B(Multipliers_PIPO_Out),
	
	.P(OperacionSuma)
);

Resta Resta(
	.A(Producto_Op),
	.B(Multipliers_PIPO_Out),
	
	.P(OperacionResta)
);

assign ProductoFinal = {Aux_Producto[(DW*2)-1],Aux_Producto[(DW*2)-1:1]};
PIPO_2
PIPO_Producto(
	.clk(clkInter),
	.rst(rst),
	.enb(ready_wire_flag),
	.inp({1'b0,Aux_Producto[(DW*2)-1:1]}),
	
	.out(product)
);

assign ready = ready_wire_flag;

endmodule 