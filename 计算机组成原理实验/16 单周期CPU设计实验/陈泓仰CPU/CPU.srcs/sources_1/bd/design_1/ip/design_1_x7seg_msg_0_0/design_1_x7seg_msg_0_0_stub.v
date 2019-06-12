// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Fri Nov 17 11:14:34 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_x7seg_msg_0_0/design_1_x7seg_msg_0_0_stub.v
// Design      : design_1_x7seg_msg_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "x7seg_msg,Vivado 2016.4" *)
module design_1_x7seg_msg_0_0(CLK_div, clr, res, a_to_g, pos)
/* synthesis syn_black_box black_box_pad_pin="CLK_div,clr,res[15:0],a_to_g[6:0],pos[3:0]" */;
  input CLK_div;
  input clr;
  input [15:0]res;
  output [6:0]a_to_g;
  output [3:0]pos;
endmodule
