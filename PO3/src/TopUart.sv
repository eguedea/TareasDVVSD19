module TopUart
(
input logic clk,
input logic rst,
input logic serial_data_rx,
input logic clearInterrupt,
input logic transmit,
output logic serial_output_tx,
output logic RXinterrupt,
output logic parityError,
output logic [7:0] recieved_data,
output logic [7:0] data_to_transmit
);


endmodule