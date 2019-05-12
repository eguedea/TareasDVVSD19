//Nombre: Counter
//Descripcion: Contador invidual para los ciclos dentro de la maquina de estados
//Entrada:clk,reset,enable,sync_reset
//Salida:SM_flag
//Autor: Alberto Contreras, Eric Guedea Osuna
//Fecha: 11 de marzo del 2019

module Counter
#(
	parameter DW = 8, //Numero de bits o ciclos
	parameter NBits = CeilLog2(DW) -1 //tamaño del contador
)
(
	// Input Ports
	input clk,
	input reset,
	input enable, //Viene de la maquina de estados
	input sync_reset,

	// Output Ports
	output SM_flag //Salida hacia la entrada de sm
);

bit SM_bit;

logic [DW-1: 0] count_log;

	always_ff@(posedge clk or negedge reset) begin
		if (reset == 1'b0)
			count_log <= {2{1'b0}};
		else begin
				if(enable == 1'b1) begin
					if(sync_reset == 0)
						count_log <= count_log + 1'b1;
					else
						count_log <= 0;
				end
		end
	end

//--------------------------------------------------------------------------------------------

always_comb
	if(count_log == DW-1)
		SM_bit = 1;
	else
		SM_bit = 0;


//---------------------------------------------------------------------------------------------
assign SM_flag = SM_bit;

 /*--------------------------------------------------------------------*/
 /*Log Function*/
     function integer CeilLog2;
       input integer data;
       integer i,result;
       begin
          for(i=0; 2**i < data; i=i+1)
             result = i + 1;
          CeilLog2 = result;
       end
    endfunction

 /*--------------------------------------------------------------------*/
endmodule
