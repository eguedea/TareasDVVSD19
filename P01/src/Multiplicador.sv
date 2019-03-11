//Nombre: Multiplicador
//Descripcion: Top del modulo donde succeden todas las instanciaciones
//Entrada:Clk, rst, start, sync_reset, multiplicand y multipliers
//Salida: ready y product
//Autor: Alberto Contreras, Eric Guedea Osuna
//Fecha: 11 de marzo del 2019


module Multiplicador 
#(
	parameter DW = 8
)(
	input 		   clk,
	input				rst,
	input				start,
	input logic [DW-1:0] multiplicand,
	input logic [DW-1:0] multipliers,
	
	
	output			ready,
	output logic [(DW*2)-1:0] product,
	output logic [(DW*2)-1:0] ProductoFinal
);


wire cont_flag_Wire;
wire enable_cont_wire;
wire enable_Operation_wire;
wire enable_sync_rst_wire;
wire [DW*2:0]Aux_Producto;
wire Start_Shot;
wire [DW-1:0]Multiplicand_PIPO_Out;
wire [DW-1:0]Multipliers_PIPO_Out;

wire ready_wire_flag;

One_Shot
Start(
	.clk(clk),
	.reset(rst),
	.Start(start),
	
	.Shot(Start_Shot)
);

PIPO
PIPO_Multiplicand(
	.clk(clk),
	.rst(rst),
	.enb(Start_Shot),
	.inp(multiplicand),
	
	.out(Multiplicand_PIPO_Out)
);

PIPO
PIPO_Multiplier(
	.clk(clk),
	.rst(rst),
	.enb(Start_Shot),
	.inp(multipliers),
	
	.out(Multipliers_PIPO_Out)
);


StateMachine
Unidad_Control(
	.clk(clk),
	.reset(rst),
	.count_flag(cont_flag_Wire),
	.start(Start_Shot), // iniciar en idle
	.count_wire(enable_cont_wire),//comenzar a contar ciclos
	.sync_reset(enable_sync_rst_wire), //limpiar registros
	.ready_wire(ready_wire_flag), 
	.Operation(enable_Operation_wire)
);


Counter
#(.DW(DW))
Modulo_Contador
(
	.clk(clk),
	.reset(rst),
	.enable(enable_cont_wire), //Viene de la maquina de estados
	.sync_reset(enable_sync_rst_wire),
	.SM_flag(cont_flag_Wire) //Salida hacia la entrada de sm
);

Booth
#(.DW(DW))
Modulo_Multi
(
	.clk(clk),
	.reset(rst),
	.load(enable_Operation_wire),
	.ready(ready_wire_flag),
	.Multiplicand_in(Multiplicand_PIPO_Out),
	.M(Multipliers_PIPO_Out),
	.Product_Aux({Aux_Producto[(DW*2)-1],Aux_Producto[(DW*2)-1:0]}),
	
	.Producto(Aux_Producto)

);

assign ProductoFinal = {Aux_Producto[(DW*2)-1],Aux_Producto[(DW*2)-1:1]};
PIPO
#(.DW(DW*2))
PIPO_Producto(
	.clk(clk),
	.rst(rst),
	.enb(ready_wire_flag),
	.inp({Aux_Producto[(DW*2)-1],Aux_Producto[(DW*2)-1:1]}),
	
	.out(product)
);

assign ready = ready_wire_flag;

endmodule 