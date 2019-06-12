vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../sss.srcs/sources_1/bd/sss/ipshared/3106/BCD2SEG7.v" \
"../../../../sss.srcs/sources_1/bd/sss/ip/sss_BCD2SEG7_0_0/sim/sss_BCD2SEG7_0_0.v" \
"../../../../sss.srcs/sources_1/bd/sss/ipshared/e3e7/xup_inv.srcs/sources_1/new/xup_inv.v" \
"../../../../sss.srcs/sources_1/bd/sss/ip/sss_xup_inv_0_1/sim/sss_xup_inv_0_1.v" \
"../../../../sss.srcs/sources_1/bd/sss/ip/sss_xup_inv_0_2/sim/sss_xup_inv_0_2.v" \
"../../../../sss.srcs/sources_1/bd/sss/ip/sss_xup_inv_0_3/sim/sss_xup_inv_0_3.v" \
"../../../../sss.srcs/sources_1/bd/sss/ip/sss_xup_inv_0_4/sim/sss_xup_inv_0_4.v" \
"../../../../sss.srcs/sources_1/bd/sss/hdl/sss.v" \


vlog -work xil_defaultlib "glbl.v"

