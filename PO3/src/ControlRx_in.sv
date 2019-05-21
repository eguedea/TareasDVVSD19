package ControlRx_in;


localparam MaxState   = 4;
localparam DW   = 8;
localparam MaxCMD   = 2;
localparam bit_timing = 50000000/1000;
localparam UartCounter = 32;


localparam IniciaTrama = 8'hFE;
localparam TerminaTrama = 8'hFE;

localparam SizeProduct = 8'h01;
localparam StartTransmision = 8'h03;
localparam MatrizData = 8'h04;
localparam VectorData = 8'h05;

typedef logic [MaxState-1:0]  RxInState_t;
typedef logic [MaxState-1:0]  Processor_t;

typedef logic [UartCounter-1:0] uartCounterDataType;

typedef logic [DW-1:0]  DataIn_t;

typedef logic [MaxCMD-1:0]  MaxCMD_t;

typedef logic [DW-1:0] Matriz_t [63:0];
typedef logic [DW-1:0] Vector_t [DW-1:0];

typedef logic One_t;


typedef enum RxInState_t {
		WAIT_UART,
		INDEX_NUMBER,
		DATA_CMD,
		LONGITUD_MATRIZ,
		DATA_MATRIZ,
		DATA_VECTOR,
		FINAL_TRAMA
	
} StateRxIn_t;

typedef enum Processor_t {
		Iddle,
		Processor_1,
		Processor_2,
		Processor_3,
		Processor_4,
		FIFO
	
} StatePrecessor_t;

typedef struct {
	DataIn_t		L_Trama;
	DataIn_t		L_Matriz;
	DataIn_t		M_Cuadrada;	
}RxIn_t;


endpackage: ControlRx_in