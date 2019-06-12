//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
//Date        : Mon Nov 20 11:14:07 2017
//Host        : XiaoXin running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (A,
    B,
    r);
  input A;
  input B;
  output r;

  wire ALU_0_result;
  wire A_1;
  wire B_1;
  wire control_unit_0_r;

  assign A_1 = A;
  assign B_1 = B;
  assign r = control_unit_0_r;
  design_1_ALU_0_1 ALU_0
       (.A(A_1),
        .B(B_1),
        .result(ALU_0_result));
  design_1_control_unit_0_0 control_unit_0
       (.q(ALU_0_result),
        .r(control_unit_0_r),
        .we(1'b0));
endmodule
