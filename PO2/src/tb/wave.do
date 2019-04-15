onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Multiplicador_TB/clk
add wave -noupdate /Multiplicador_TB/rst
add wave -noupdate /Multiplicador_TB/start
add wave -noupdate -radix decimal /Multiplicador_TB/multiplicand
add wave -noupdate -radix decimal /Multiplicador_TB/multipliers
add wave -noupdate /Multiplicador_TB/ready
add wave -noupdate -radix decimal /Multiplicador_TB/product
add wave -noupdate /Multiplicador_TB/ProductoFinal
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/clk
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/reset
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/start
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/count_flag
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/count_wire
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/sync_reset
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/ready_wire
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/Operation
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/State
add wave -noupdate /Multiplicador_TB/uut/Modulo_Contador/clk
add wave -noupdate /Multiplicador_TB/uut/Modulo_Contador/reset
add wave -noupdate /Multiplicador_TB/uut/Modulo_Contador/enable
add wave -noupdate /Multiplicador_TB/uut/Modulo_Contador/sync_reset
add wave -noupdate /Multiplicador_TB/uut/Modulo_Contador/SM_flag
add wave -noupdate /Multiplicador_TB/uut/Modulo_Contador/SM_bit
add wave -noupdate /Multiplicador_TB/uut/Modulo_Contador/count_log
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 181
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
WaveRestoreZoom {8168 ps} {39336 ps}
