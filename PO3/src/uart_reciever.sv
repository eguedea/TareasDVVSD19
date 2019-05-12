module uart_reciever
import DataTypes::*;
(

input bit_t clk,
input bit_t reset,
input bit_t clear_interrupt,
input bit_t serial_data_rx,
output uint8_t recieved_data_rx,
output bit_t rx_interrupt,
output bit_t parity_error

);

logic [7:0] RX_local_data;

always_ff@(posedge clk or negedge reset) begin
	if(reset == '0)	
		RX_local_data <= '0;
	else begin
		RX_local_data <= serial_data_rx;
	end

end
endmodule

