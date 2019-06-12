onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib sy9_opt

do {wave.do}

view wave
view structure
view signals

do {sy9.udo}

run -all

quit -force
