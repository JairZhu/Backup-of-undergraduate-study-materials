set_property SRC_FILE_INFO {cfile:d:/Xilinx_Proj_Mar/B3_Lab/Lab3/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/clock/clock.xdc rfile:../../../Oscilloscope.srcs/sources_1/ip/clock/clock.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
