//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
//Date        : Mon May 01 17:38:13 2017
//Host        : surface running 64-bit major release  (build 9200)
//Command     : generate_target ALU.bd
//Design      : ALU
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ALU,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ALU,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=19,numReposBlks=19,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "ALU.hwdef" *) 
module ALU
   (OA,
    OB,
    OC,
    OS1,
    OS2,
    S0,
    S1,
    S2,
    VCC,
    Y1,
    Y2,
    a,
    b,
    c,
    ground,
    oS0);
  output OA;
  output OB;
  output OC;
  output OS1;
  output OS2;
  input S0;
  input S1;
  input S2;
  input VCC;
  output Y1;
  output Y2;
  input a;
  input b;
  input c;
  input ground;
  output oS0;

  wire S0_1;
  wire S1_1;
  wire S2_1;
  wire VCC_1;
  wire a_1;
  wire b_1;
  wire c_1;
  wire decode138_0_Y1_n;
  wire decode138_0_Y2_n;
  wire decode138_0_Y3_n;
  wire decode138_0_Y4_n;
  wire decode138_0_Y5_n;
  wire decode138_0_Y6_n;
  wire decode138_0_Y7_n;
  wire ground_1;
  wire mux_8_to_1_0_Q;
  wire mux_8_to_1_0_Q_n;
  wire xup_and2_0_y;
  wire xup_inv_0_y;
  wire xup_inv_1_y;
  wire xup_inv_2_y;
  wire xup_inv_3_y;
  wire xup_inv_4_y;
  wire xup_nand2_1_y;
  wire xup_nand3_0_y;
  wire xup_nand4_0_y;
  wire xup_nand4_1_y;
  wire xup_nand4_2_y;
  wire xup_nand4_3_y;
  wire xup_nand4_4_y;
  wire xup_nand4_5_y;
  wire xup_nand5_0_y;
  wire xup_or2_0_y;
  wire xup_xor2_0_y;

  assign OA = a_1;
  assign OB = b_1;
  assign OC = c_1;
  assign OS1 = S1_1;
  assign OS2 = S2_1;
  assign S0_1 = S0;
  assign S1_1 = S1;
  assign S2_1 = S2;
  assign VCC_1 = VCC;
  assign Y1 = mux_8_to_1_0_Q;
  assign Y2 = xup_nand5_0_y;
  assign a_1 = a;
  assign b_1 = b;
  assign c_1 = c;
  assign ground_1 = ground;
  assign oS0 = S0_1;
  ALU_decode138_0_0 decode138_0
       (.A0(b_1),
        .A1(a_1),
        .A2(c_1),
        .E1(VCC_1),
        .E2_n(ground_1),
        .E3_n(ground_1),
        .Y1_n(decode138_0_Y1_n),
        .Y2_n(decode138_0_Y2_n),
        .Y3_n(decode138_0_Y3_n),
        .Y4_n(decode138_0_Y4_n),
        .Y5_n(decode138_0_Y5_n),
        .Y6_n(decode138_0_Y6_n),
        .Y7_n(decode138_0_Y7_n));
  ALU_mux_8_to_1_0_0 mux_8_to_1_0
       (.A0(S0_1),
        .A1(S1_1),
        .A2(S2_1),
        .D0(xup_and2_0_y),
        .D1(xup_or2_0_y),
        .D2(xup_inv_0_y),
        .D3(xup_inv_1_y),
        .D4(xup_xor2_0_y),
        .D5(xup_nand4_0_y),
        .D6(xup_nand4_0_y),
        .D7(ground_1),
        .Q(mux_8_to_1_0_Q),
        .Q_n(mux_8_to_1_0_Q_n),
        .S_n(ground_1));
  ALU_xup_and2_0_0 xup_and2_0
       (.a(b_1),
        .b(a_1),
        .y(xup_and2_0_y));
  ALU_xup_inv_0_0 xup_inv_0
       (.a(a_1),
        .y(xup_inv_0_y));
  ALU_xup_inv_0_1 xup_inv_1
       (.a(b_1),
        .y(xup_inv_1_y));
  ALU_xup_inv_0_2 xup_inv_2
       (.a(S1_1),
        .y(xup_inv_2_y));
  ALU_xup_inv_0_3 xup_inv_3
       (.a(S0_1),
        .y(xup_inv_3_y));
  ALU_xup_inv_4_0 xup_inv_4
       (.a(S2_1),
        .y(xup_inv_4_y));
  ALU_xup_nand2_1_0 xup_nand2_1
       (.a(xup_inv_4_y),
        .b(mux_8_to_1_0_Q_n),
        .y(xup_nand2_1_y));
  ALU_xup_nand3_0_0 xup_nand3_0
       (.a(xup_inv_3_y),
        .b(xup_inv_2_y),
        .c(mux_8_to_1_0_Q_n),
        .y(xup_nand3_0_y));
  ALU_xup_nand4_0_0 xup_nand4_0
       (.a(decode138_0_Y1_n),
        .b(decode138_0_Y2_n),
        .c(decode138_0_Y4_n),
        .d(decode138_0_Y7_n),
        .y(xup_nand4_0_y));
  ALU_xup_nand4_0_1 xup_nand4_1
       (.a(decode138_0_Y3_n),
        .b(decode138_0_Y5_n),
        .c(decode138_0_Y6_n),
        .d(decode138_0_Y7_n),
        .y(xup_nand4_1_y));
  ALU_xup_nand4_0_2 xup_nand4_2
       (.a(decode138_0_Y1_n),
        .b(decode138_0_Y2_n),
        .c(decode138_0_Y3_n),
        .d(decode138_0_Y7_n),
        .y(xup_nand4_2_y));
  ALU_xup_nand4_1_0 xup_nand4_3
       (.a(S2_1),
        .b(xup_inv_2_y),
        .c(S0_1),
        .d(xup_nand4_1_y),
        .y(xup_nand4_3_y));
  ALU_xup_nand4_1_1 xup_nand4_4
       (.a(S2_1),
        .b(S1_1),
        .c(xup_inv_3_y),
        .d(xup_nand4_2_y),
        .y(xup_nand4_4_y));
  ALU_xup_nand4_5_0 xup_nand4_5
       (.a(S2_1),
        .b(S0_1),
        .c(S1_1),
        .d(ground_1),
        .y(xup_nand4_5_y));
  ALU_xup_nand5_0_0 xup_nand5_0
       (.a(xup_nand4_5_y),
        .b(xup_nand2_1_y),
        .c(xup_nand4_4_y),
        .d(xup_nand4_3_y),
        .e(xup_nand3_0_y),
        .y(xup_nand5_0_y));
  ALU_xup_or2_0_0 xup_or2_0
       (.a(b_1),
        .b(a_1),
        .y(xup_or2_0_y));
  ALU_xup_xor2_0_0 xup_xor2_0
       (.a(b_1),
        .b(a_1),
        .y(xup_xor2_0_y));
endmodule
