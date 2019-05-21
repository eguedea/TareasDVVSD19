package UART_pkg;

localparam DW       = 8;
localparam MaxState   = 3;

localparam CounterWait = 217;
localparam CounterFull = 434;
localparam CounterFin = 434*8;


typedef logic [DW-1:0] 			int8_t;
typedef logic          			One_t;
typedef logic [MaxState-1:0]  MaxState_t;

typedef logic  [DW-1:0] Matriz_U [63:0];
typedef logic  [DW-1:0] Vector_U [DW-1:0];


typedef struct {
	int8_t	rgstr_r;
} sipo_t;

typedef enum MaxState_t {
		IDLE,
		WAIT,
		RECIVE,
		PARITY,
		READY
	
} state_t;



endpackage: UART_pkg