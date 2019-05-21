onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /UART_TB/DUV/Receiver/clk
add wave -noupdate /UART_TB/DUV/Receiver/reset
add wave -noupdate -radix hexadecimal /UART_TB/DUV/Receiver/received_data
add wave -noupdate /UART_TB/DUV/Receiver/state
add wave -noupdate -divider {FSM RX uart}
add wave -noupdate /UART_TB/DUV/Cnt_in/DataReady_Rx
add wave -noupdate -radix hexadecimal /UART_TB/DUV/Cnt_in/DataRecive_Rx
add wave -noupdate /UART_TB/DUV/Cnt_in/L_Matriz
add wave -noupdate /UART_TB/DUV/Cnt_in/Longitud_Trama
add wave -noupdate /UART_TB/DUV/Cnt_in/Longitud_Matriz
add wave -noupdate /UART_TB/DUV/Cnt_in/SaveData_Matriz
add wave -noupdate /UART_TB/DUV/Cnt_in/SaveData_Vector
add wave -noupdate /UART_TB/DUV/Cnt_in/State
add wave -noupdate /UART_TB/DUV/Cnt_in/Counter
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider Proccesadoress
add wave -noupdate -radix unsigned /UART_TB/DUV/Top_Procesor/salidas/P
add wave -noupdate -radix decimal /UART_TB/DUV/Top_Procesor/Size_Matriz
add wave -noupdate /UART_TB/DUV/Top_Procesor/enable_Data
add wave -noupdate -radix unsigned /UART_TB/DUV/Top_Procesor/Acomulador_P0
add wave -noupdate -radix unsigned /UART_TB/DUV/Top_Procesor/Acomulador_P1
add wave -noupdate -radix unsigned /UART_TB/DUV/Top_Procesor/Acomulador_P2
add wave -noupdate -radix unsigned /UART_TB/DUV/Top_Procesor/Acomulador_P3
add wave -noupdate -radix unsigned /UART_TB/DUV/Top_Procesor/OutAcomulador
add wave -noupdate -radix unsigned /UART_TB/DUV/Top_Procesor/Out_FIFO
add wave -noupdate /UART_TB/DUV/Top_Procesor/Activa_FIFO
add wave -noupdate /UART_TB/DUV/Top_Procesor/FIFO_POP
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6987013 ps} 0}
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
WaveRestoreZoom {149497600 ps} {673785600 ps}
