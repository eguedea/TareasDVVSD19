onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Multiplicador_TB/uut/clk
add wave -noupdate /Multiplicador_TB/uut/rst
add wave -noupdate /Multiplicador_TB/uut/start
add wave -noupdate /Multiplicador_TB/uut/multiplicand
add wave -noupdate /Multiplicador_TB/uut/multipliers
add wave -noupdate /Multiplicador_TB/uut/ready
add wave -noupdate /Multiplicador_TB/uut/product
add wave -noupdate /Multiplicador_TB/uut/ProductoFinal
add wave -noupdate /Multiplicador_TB/uut/cont_flag_Wire
add wave -noupdate /Multiplicador_TB/uut/enable_cont_wire
add wave -noupdate /Multiplicador_TB/uut/enable_Operation_wire
add wave -noupdate /Multiplicador_TB/uut/enable_sync_rst_wire
add wave -noupdate /Multiplicador_TB/uut/Aux_Producto
add wave -noupdate /Multiplicador_TB/uut/Start_Shot
add wave -noupdate /Multiplicador_TB/uut/Multiplicand_PIPO_Out
add wave -noupdate /Multiplicador_TB/uut/Multipliers_PIPO_Out
add wave -noupdate /Multiplicador_TB/uut/ready_wire_flag
add wave -noupdate /Multiplicador_TB/uut/OperacionSuma
add wave -noupdate /Multiplicador_TB/uut/OperacionResta
add wave -noupdate /Multiplicador_TB/uut/Producto_Op
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/clk
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/reset
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/start
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/count_flag
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/count_wire
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/sync_reset
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/ready_wire
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/Operation
add wave -noupdate /Multiplicador_TB/uut/Unidad_Control/State
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14366 ps} 0}
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
WaveRestoreZoom {8868 ps} {40868 ps}
