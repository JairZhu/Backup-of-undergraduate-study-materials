onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+sy9 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.sy9 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {sy9.udo}

run -all

endsim

quit -force
