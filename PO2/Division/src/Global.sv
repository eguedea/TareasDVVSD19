package Global;

localparam DW = 4;
localparam DW_2= DW*2;

typedef enum logic [1:0]{
					IDLE,
					SETUP,
					PROCESS,
					READY
					} State_t;
					
endpackage // global