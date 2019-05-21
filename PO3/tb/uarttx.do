onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /uart_transmitter_tb/UUT/txfsm/clk
add wave -noupdate /uart_transmitter_tb/UUT/txfsm/reset
add wave -noupdate /uart_transmitter_tb/UUT/txfsm/start
add wave -noupdate /uart_transmitter_tb/UUT/txfsm/next_bit
add wave -noupdate /uart_transmitter_tb/UUT/txfsm/bit_counter
add wave -noupdate /uart_transmitter_tb/UUT/txfsm/reset_timer
add wave -noupdate /uart_transmitter_tb/UUT/txfsm/increment_bit_counter
add wave -noupdate /uart_transmitter_tb/UUT/txfsm/reset_bit_counter
add wave -noupdate /uart_transmitter_tb/UUT/txfsm/shift_reg
add wave -noupdate /uart_transmitter_tb/UUT/txfsm/load_reg
add wave -noupdate /uart_transmitter_tb/UUT/txfsm/busy
add wave -noupdate /uart_transmitter_tb/UUT/txfsm/idle_line
add wave -noupdate /uart_transmitter_tb/UUT/txfsm/txstates
add wave -noupdate /uart_transmitter_tb/UUT/uartpiso/clk
add wave -noupdate /uart_transmitter_tb/UUT/uartpiso/reset
add wave -noupdate /uart_transmitter_tb/UUT/uartpiso/enb
add wave -noupdate /uart_transmitter_tb/UUT/uartpiso/load
add wave -noupdate /uart_transmitter_tb/UUT/uartpiso/shift
add wave -noupdate /uart_transmitter_tb/UUT/uartpiso/inp
add wave -noupdate /uart_transmitter_tb/UUT/uartpiso/fsmReset
add wave -noupdate /uart_transmitter_tb/UUT/uartpiso/out
add wave -noupdate /uart_transmitter_tb/UUT/uartpiso/rgstr_r
add wave -noupdate /uart_transmitter_tb/clk
add wave -noupdate /uart_transmitter_tb/reset
add wave -noupdate /uart_transmitter_tb/transmit
add wave -noupdate /uart_transmitter_tb/data
add wave -noupdate /uart_transmitter_tb/serial_output_rx
add wave -noupdate /uart_transmitter_tb/busy
add wave -noupdate /uart_transmitter_tb/div
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {19998 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {16384 ps}
