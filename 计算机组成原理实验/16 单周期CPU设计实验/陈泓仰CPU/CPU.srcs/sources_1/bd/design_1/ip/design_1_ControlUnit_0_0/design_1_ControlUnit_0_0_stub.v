// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Wed Nov 15 23:44:02 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_ControlUnit_0_0/design_1_ControlUnit_0_0_stub.v
// Design      : design_1_ControlUnit_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ControlUnit,Vivado 2016.4" *)
module design_1_ControlUnit_0_0(op, Zero, Sign, ExtSel, PCWre, InsMemRW, RegDst, 
  RegWre, AluOp, AluSrcA, AluSrcB, RD, WR, DBDataSrc, PCSrc)
/* synthesis syn_black_box black_box_pad_pin="op[5:0],Zero,Sign,ExtSel,PCWre,InsMemRW,RegDst,RegWre,AluOp[2:0],AluSrcA,AluSrcB,RD,WR,DBDataSrc,PCSrc[1:0]" */;
  input [5:0]op;
  input Zero;
  input Sign;
  output ExtSel;
  output PCWre;
  output InsMemRW;
  output RegDst;
  output RegWre;
  output [2:0]AluOp;
  output AluSrcA;
  output AluSrcB;
  output RD;
  output WR;
  output DBDataSrc;
  output [1:0]PCSrc;
endmodule
