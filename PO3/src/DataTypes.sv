`ifndef DATATYPES
	`define DATATYPES
package DataTypes;

	typedef logic [7:0] uint8_t;
	typedef logic bit_t;
	typedef enum {IDLE, SETUP, COUNT, SHIFT, WAIT} TX_STATE;
	
	///UART TIMER AND TIMING
	parameter bit_timing = (50000000/115200);
	parameter uartCounterMaxSizeBitSize = CeilLog2(bit_timing);
	typedef logic [uartCounterMaxSizeBitSize-1:0] uartCounterDataType;
	parameter bits_amount = CeilLog2(11);
	parameter bitspertx = 11;
	typedef logic [bits_amount-1:0] uartBitsAmountCounter;
	
	parameter usingEvenParity = 1'b1;
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
