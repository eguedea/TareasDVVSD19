`timescale 1ns/1ps

module UART_TB;
import UART_pkg::*; 


	logic clk=0;
	logic reset;
	
	logic serial_rx;
	int8_t received_data;
	//int8_t DataOutPrueba=0;



UART
DUV
(
	.clk(clk),
	.reset(reset),
	
	.serial_rx(serial_rx),
	.received_data(received_data)
	//.DataOutPrueba(DataOutPrueba)
);

/*********************************************************/
initial // Clock generator
  begin
    forever #0.5 clk = !clk;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset = 0;
	serial_rx = 1;

	#2 reset = 1;
end

/*********************************************************/
initial begin // enable
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	///////////////////////////////////////////////////////////////////////////// Size product
		//FE
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//03
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//01
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//04
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//EF
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
/////////////////////////////////////////////////////////////////////////////Data Transmit Matriz
		//FE
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		// 18
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
	
		//04
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;

		//00
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//01
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;

		//02
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;

		//03
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//04
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//05
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//06
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//07
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//08
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//09
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;

		//0A
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;

		//0B
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//0C
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//0D
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//0E
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;

		//0F
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;

		//EF
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;

	/////////////////////////////////////////////////////////////////////////////Data Transmit VECTOR
		//FE
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		// 06
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
	
		//05
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;

	
		//01
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;

		//02
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;

		//03
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;
	
		//04
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	
	#434 serial_rx = 1;
	#868 serial_rx = 0;

			//EF
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	#434 serial_rx = 1;
	
	#434 serial_rx = 1;


end



/*********************************************************/


endmodule
