onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+sss -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.sss xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {sss.udo}

run -all

endsim

quit -force
