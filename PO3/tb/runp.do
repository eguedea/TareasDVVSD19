if [file exists work] {vdel -all}
vlib work
vlog -f PFILES.f
onbreak {resume}
set NoQuitOnFinish 1
vsim -voptargs=+acc=npr  work.UART_TB
do pwave.do
run 1000ns
