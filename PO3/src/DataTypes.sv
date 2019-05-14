`ifndef DATATYPES
	`define DATATYPES
package DataTypes;

	typedef logic [7:0] uint8_t;
	typedef logic bit_t;
	typedef enum {IDLE, SETUP, COUNT, SHIFT, WAIT} TX_STATE;
	
	//FIFO PARAMETERS
	parameter DW_fifo = 8;
	typedef logic [DW_fifo-1:0] fifo_in;
	typedef logic [DW_fifo-1:0] fifo_out;
	//POINTER PARameters
	typedef logic [3:0] RAM_size;
	//RAM PARAMETERS//
	parameter DATA_WIDTH=8; 
	parameter ADDR_WIDTH=3;
	typedef logic [ADDR_WIDTH-1:0] ADDR_W; 
	typedef logic [DATA_WIDTH-1:0] DATA_W;
	//Converter parameters
	

	///UART TIMER AND TIMING
	parameter bit_timing = (50000000/115200);
	parameter uartCounterMaxSizeBitSize = CeilLog2(bit_timing);
	typedef logic [uartCounterMaxSizeBitSize-1:0] uartCounterDataType;
	parameter bits_amount = CeilLog2(10);
	parameter bitspertx = 11;
	typedef logic [bits_amount-1:0] uartBitsAmountCounter;
	
	parameter usingEvenParity = 1'b0;
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
	 //////////////////////////////////////////////
endpackage
`endif
