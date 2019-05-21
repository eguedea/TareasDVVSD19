if [file exists work] {vdel -all}
vlib work
vlog -f txfiles.f
onbreak {resume}
set NoQuitOnFinish 1
vsim -voptargs=+acc work.uart_transmitter_tb
do uarttx.do
run 20ns
