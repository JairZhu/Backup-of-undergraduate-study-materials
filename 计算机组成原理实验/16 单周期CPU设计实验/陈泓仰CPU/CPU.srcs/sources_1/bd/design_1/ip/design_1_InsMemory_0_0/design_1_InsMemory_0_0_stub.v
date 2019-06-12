// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Fri Nov 17 00:08:00 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_InsMemory_0_0/design_1_InsMemory_0_0_stub.v
// Design      : design_1_InsMemory_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "InsMemory,Vivado 2016.4" *)
module design_1_InsMemory_0_0(IAddress, InsMemRW, op, rs, rt, rd, immediate, AJshift, 
  sa)
/* synthesis syn_black_box black_box_pad_pin="IAddress[31:0],InsMemRW,op[5:0],rs[4:0],rt[4:0],rd[4:0],immediate[15:0],AJshift[25:0],sa[4:0]" */;
  input [31:0]IAddress;
  input InsMemRW;
  output [5:0]op;
  output [4:0]rs;
  output [4:0]rt;
  output [4:0]rd;
  output [15:0]immediate;
  output [25:0]AJshift;
  output [4:0]sa;
endmodule
