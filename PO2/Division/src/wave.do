onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /Division_Top_TB/uut/clk
add wave -noupdate -radix unsigned /Division_Top_TB/uut/rst
add wave -noupdate -radix unsigned /Division_Top_TB/uut/start
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Dividendo
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Divisor
add wave -noupdate -radix unsigned /Division_Top_TB/uut/ready
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Cosiente
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Residuo
add wave -noupdate -radix unsigned /Division_Top_TB/uut/cont_flag_Wire
add wave -noupdate -radix unsigned /Division_Top_TB/uut/enable_cont_wire
add wave -noupdate -radix unsigned /Division_Top_TB/uut/enable_Operation_wire
add wave -noupdate -radix unsigned /Division_Top_TB/uut/enable_sync_rst_wire
add wave -noupdate -radix unsigned /Division_Top_TB/uut/ready_wire_flag
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Wire_Qm
add wave -noupdate -radix unsigned /Division_Top_TB/uut/A_Resta
add wave -noupdate -radix unsigned /Division_Top_TB/uut/R_Suma
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Op_Aux_resta
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Unidad_Control/clk
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Unidad_Control/reset
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Unidad_Control/start
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Unidad_Control/count_flag
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Unidad_Control/count_wire
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Unidad_Control/sync_reset
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Unidad_Control/ready_wire
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Unidad_Control/Operation
add wave -noupdate -radix unsigned /Division_Top_TB/uut/Unidad_Control/State
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {22563 ps} 0}
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
WaveRestoreZoom {5718 ps} {37718 ps}
