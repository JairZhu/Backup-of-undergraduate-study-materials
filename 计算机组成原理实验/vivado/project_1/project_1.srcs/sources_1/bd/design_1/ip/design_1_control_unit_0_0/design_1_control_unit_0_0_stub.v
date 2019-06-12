// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Mon Nov 20 11:15:07 2017
// Host        : XiaoXin running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/vivado/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_control_unit_0_0/design_1_control_unit_0_0_stub.v
// Design      : design_1_control_unit_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "control_unit,Vivado 2017.3" *)
module design_1_control_unit_0_0(q, we, r)
/* synthesis syn_black_box black_box_pad_pin="q,we,r" */;
  input q;
  input we;
  output r;
endmodule
