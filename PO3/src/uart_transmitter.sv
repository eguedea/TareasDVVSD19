
module uart_transmitter
import DataTypes::*;

(
input bit_t clk,
input bit_t reset,
input bit_t transmit,
input uint8_t data,
output bit_t serial_output_rx,
output bit_t busy,
output bit_t div
);


bit_t start_wire = '0;
bit_t next_bit_wire = '0;
bit_t bit_counter_wire = '0;
bit_t reset_timer_wire = '0;
bit_t increment_bit_counter_wire = '0;
bit_t reset_bit_counter_wire = '0;
bit_t shift_reg_wire = '0;
bit_t load_reg_wire = '0;
bit_t busy_wire = '0;
bit_t parity = '0;
bit_t shot_wire = '0;
bit_t idle_line_wire = '0;

One_Shot txshot
(
.*,
.Start (transmit),
.Shot	(shot_wire)
);

uart_tx_fsm txfsm
(
.clk	(clk),
.reset (reset),
.start	(shot_wire),
.next_bit (next_bit_wire),
.bit_counter (bit_counter_wire),
.reset_timer (reset_timer_wire),
.increment_bit_counter (increment_bit_counter_wire),
.reset_bit_counter (reset_bit_counter_wire),
.shift_reg (shift_reg_wire),
.load_reg	(load_reg_wire),
.busy	(busy),
.idle_line (idle_line_wire)

);

uart_timer rxtimer
(
.*,
.reset_timer (reset_timer_wire),
.next_bit (next_bit_wire)

);

uart_bit_counter rxbitcounter
(
.*,
.increment_bit_counter (increment_bit_counter_wire),
.reset_bit_counter (reset_bit_counter_wire),
.bit_counter (bit_counter_wire)
);


uart_parity_mod uartparitygen
(
.data	(data),
.parity (parity)

);

piso_msb uartpiso
(
.*,
.enb	(shift_reg_wire|load_reg_wire),
.load	(load_reg_wire),
.shift (shift_reg_wire),
.inp ({1'b0,data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],parity,1'b1}),
.fsmReset	(idle_line_wire),
.out (serial_output_rx)
);

freqdiv fr
(
.*
);
//data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7]


endmodule