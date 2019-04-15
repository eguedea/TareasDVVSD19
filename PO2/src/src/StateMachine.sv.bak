//Nombre: StateMachine
//Descripcion: Maquina de estados encargada de controlar los ciclos
//del algoritmo de booth
//Entrada: clk, reset, start, count_flag
//Salida: count_wire, sync_reset, ready_wire, Operation
//Autor: Alberto Contreras, Eric Guedea Osuna
//Fecha: 11 de marzo del 2019

module StateMachine 
#(
parameter DW = 8
)
(
input clk,
input reset,
input start,
input count_flag,

output logic count_wire,//comenzar a contar ciclos
output logic sync_reset,
output logic ready_wire,
output logic Operation	
);


enum logic [1:0]{IDLE, SETUP, PROCESS, READY} State;

always_ff@(posedge clk or negedge reset)
begin
if(reset == 0)	
	State <= IDLE;
else
	case(State)
		IDLE:
		if(start == 0)
			State <= IDLE;
		else if(start == 1)
			State <= SETUP;
		SETUP:
			State <= PROCESS;
		PROCESS:
			if(count_flag == 0)
				State <= PROCESS;
			else if(count_flag == 1)
				State <= READY;
		READY:
			State <= IDLE;
		default:
			State <= IDLE;
	endcase
end
//Activación de salidas
always_comb
begin
  //Por defecto todas estan en 0
	count_wire = 0; //habilitar contador
	sync_reset = 0; //Se resetea el contador
	ready_wire = 0; //activa el ready
	Operation = 1; //activa Operation
	case(State)
			SETUP: //Limpiamos registros, iniciamos el contador, el shift y cargamos valores
			begin
				count_wire = 1; //habilitar contador
				sync_reset = 1; //Se resetea el contador
				ready_wire = 0; //activa el ready
				Operation = 0; //activa Operation
			end
			PROCESS: //Hacemos la multiplicacion
				begin
				count_wire = 1; //habilitar contador
				sync_reset = 0; //Se resetea el contador
				ready_wire = 0; //activa el ready
				Operation = 1; //activa Operation
			end

			READY: //Prendemos la bandera de readys
			begin
				count_wire = 0; //habilitar contador
				sync_reset = 1; //Se resetea el contador
				ready_wire = 1; //activa el ready
				Operation = 0; //activa Operation

			end
			
			default:
			begin
				count_wire = 0; //habilitar contador
				sync_reset = 1; //Se resetea el contador
				ready_wire = 0; //activa el ready
				Operation = 0; //activa Operation
			end
		endcase
end

endmodule
