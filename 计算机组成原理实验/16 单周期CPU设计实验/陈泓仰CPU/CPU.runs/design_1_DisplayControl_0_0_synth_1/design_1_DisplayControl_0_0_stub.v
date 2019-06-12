// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Fri Nov 17 23:51:26 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_DisplayControl_0_0_stub.v
// Design      : design_1_DisplayControl_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "DisplayControl,Vivado 2016.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(NowPC, NextPC, RsAddr, RsData, RtAddr, RtData, 
  AluResult, DbResult, control, res)
/* synthesis syn_black_box black_box_pad_pin="NowPC[31:0],NextPC[31:0],RsAddr[4:0],RsData[31:0],RtAddr[4:0],RtData[31:0],AluResult[31:0],DbResult[31:0],control[1:0],res[15:0]" */;
  input [31:0]NowPC;
  input [31:0]NextPC;
  input [4:0]RsAddr;
  input [31:0]RsData;
  input [4:0]RtAddr;
  input [31:0]RtData;
  input [31:0]AluResult;
  input [31:0]DbResult;
  input [1:0]control;
  output [15:0]res;
endmodule
