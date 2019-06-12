set_property SRC_FILE_INFO {cfile:d:/Xilinx_Proj_Mar/B3_Lab/Lab4/MIPS_CPU/src/prj/MIPS_CPU.srcs/sources_1/bd/MIPS_CPU/ip/MIPS_CPU_clk_wiz_0_0/MIPS_CPU_clk_wiz_0_0.xdc rfile:../../../MIPS_CPU.srcs/sources_1/bd/MIPS_CPU/ip/MIPS_CPU_clk_wiz_0_0/MIPS_CPU_clk_wiz_0_0.xdc id:1 order:EARLY scoped_inst:MIPS_CPU_i/clk_wiz_0/inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
