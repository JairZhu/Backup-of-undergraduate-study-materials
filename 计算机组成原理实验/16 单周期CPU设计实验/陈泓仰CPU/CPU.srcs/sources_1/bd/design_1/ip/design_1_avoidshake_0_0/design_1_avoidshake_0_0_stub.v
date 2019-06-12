// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Sat Nov 18 00:36:26 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_avoidshake_0_0/design_1_avoidshake_0_0_stub.v
// Design      : design_1_avoidshake_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "avoidshake,Vivado 2016.4" *)
module design_1_avoidshake_0_0(BJ_CLK, BUTTON_IN, BUTTON_OUT)
/* synthesis syn_black_box black_box_pad_pin="BJ_CLK,BUTTON_IN,BUTTON_OUT" */;
  input BJ_CLK;
  input BUTTON_IN;
  output BUTTON_OUT;
endmodule
