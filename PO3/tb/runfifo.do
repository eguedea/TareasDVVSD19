if [file exists work] {vdel -all}
vlib work
vlog -f fifofiles.f
onbreak {resume}
set NoQuitOnFinish 1
vsim -voptargs=+acc work.circularfifo_tb
do cfifo.do
run 100ps
