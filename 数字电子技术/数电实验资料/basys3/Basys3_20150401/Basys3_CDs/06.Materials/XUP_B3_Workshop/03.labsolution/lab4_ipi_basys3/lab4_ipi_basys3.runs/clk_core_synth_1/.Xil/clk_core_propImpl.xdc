set_property SRC_FILE_INFO {cfile:c:/xup/fpga_flow/labs/lab4_ipi/lab4_ipi.srcs/sources_1/ip/clk_core/clk_core.xdc rfile:../../../lab4_ipi.srcs/sources_1/ip/clk_core/clk_core.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
