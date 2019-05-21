onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /circularfifo_tb/uart_clk
add wave -noupdate /circularfifo_tb/processor_clk
add wave -noupdate /circularfifo_tb/reset
add wave -noupdate /circularfifo_tb/datainput
add wave -noupdate /circularfifo_tb/push
add wave -noupdate /circularfifo_tb/pop
add wave -noupdate /circularfifo_tb/dataoutput
add wave -noupdate /circularfifo_tb/full
add wave -noupdate /circularfifo_tb/empty
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {55 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {64 ps}
