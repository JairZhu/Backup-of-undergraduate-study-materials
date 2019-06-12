vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../bd/design_1/ip/design_1_PC_0_0/sim/design_1_PC_0_0.v" \
"../../../bd/design_1/ip/design_1_InsMemory_0_0/sim/design_1_InsMemory_0_0.v" \
"../../../bd/design_1/ip/design_1_ControlUnit_0_0/sim/design_1_ControlUnit_0_0.v" \
"../../../bd/design_1/ip/design_1_RegisterFile_0_1/sim/design_1_RegisterFile_0_1.v" \
"../../../bd/design_1/ip/design_1_DataMem_0_0/sim/design_1_DataMem_0_0.v" \
"../../../bd/design_1/ip/design_1_ALU_0_0/sim/design_1_ALU_0_0.v" \
"../../../bd/design_1/ip/design_1_SignZeroExtend_0_0/sim/design_1_SignZeroExtend_0_0.v" \
"../../../bd/design_1/ip/design_1_MuxForReadData1_0_0/sim/design_1_MuxForReadData1_0_0.v" \
"../../../bd/design_1/ip/design_1_MuxForReadData2_0_0/sim/design_1_MuxForReadData2_0_0.v" \
"../../../bd/design_1/ip/design_1_MuxForWriteData_0_0/sim/design_1_MuxForWriteData_0_0.v" \
"../../../bd/design_1/ip/design_1_MuxForWriteReg_0_1/sim/design_1_MuxForWriteReg_0_1.v" \
"../../../bd/design_1/hdl/design_1.v" \
"../../../bd/design_1/ip/design_1_DisplayControl_0_0/sim/design_1_DisplayControl_0_0.v" \
"../../../bd/design_1/ip/design_1_x7seg_msg_0_0/sim/design_1_x7seg_msg_0_0.v" \
"../../../bd/design_1/ip/design_1_CLK_div1_0_0/sim/design_1_CLK_div1_0_0.v" \
"../../../bd/design_1/ip/design_1_choose_0_0/sim/design_1_choose_0_0.v" \


vlog -work xil_defaultlib "glbl.v"

