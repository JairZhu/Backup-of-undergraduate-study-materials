// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Wed May 17 00:30:17 2017
// Host        : surface running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top sss_xup_inv_0_1 -prefix
//               sss_xup_inv_0_1_ sss_xup_inv_0_4_stub.v
// Design      : sss_xup_inv_0_4
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xup_inv,Vivado 2016.4" *)
module sss_xup_inv_0_1(a, y)
/* synthesis syn_black_box black_box_pad_pin="a,y" */;
  input a;
  output y;
endmodule
