onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /universal_reg_TB/clk
add wave -noupdate /universal_reg_TB/rst
add wave -noupdate /universal_reg_TB/enb
add wave -noupdate /universal_reg_TB/l_s
add wave -noupdate /universal_reg_TB/inp
add wave -noupdate -radix unsigned /universal_reg_TB/reg_switch
add wave -noupdate /universal_reg_TB/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {179480 ps} 0}
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
WaveRestoreZoom {0 ps} {29364 ps}
