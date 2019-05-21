`timescale 1ns/1ps

module UART_TB;



	logic clk=0;
	logic reset;
	
	logic serial_rx;
	logic [7:0]received_data;
	logic [63:0] Matriz_F [7:0];
	logic [7:0] Vector_F [7:0];


UART
DUV
(
	.clk(clk),
	.reset(reset),
	
	.serial_rx(serial_rx),
	.received_data(received_data),
	.Matriz_F (Matriz_F),
	.Vector_F(Vector_F)
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
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 0;
	#434 serial_rx = 1;
	
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
	//#434 serial_rx = 0;

end



/*********************************************************/


endmodule
