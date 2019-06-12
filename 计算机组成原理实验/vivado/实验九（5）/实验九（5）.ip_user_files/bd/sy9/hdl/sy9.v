//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
//Date        : Tue May 30 20:03:31 2017
//Host        : surface running 64-bit major release  (build 9200)
//Command     : generate_target sy9.bd
//Design      : sy9
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "sy9,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=sy9,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=32,numReposBlks=32,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "sy9.hwdef" *) 
module sy9
   (CLK1,
    CLR1_n,
    D,
    J1,
    PR1_n,
    Q1,
    Q2,
    Q3,
    Q4);
  input CLK1;
  input CLR1_n;
  input D;
  input J1;
  input PR1_n;
  output Q1;
  output Q2;
  output Q3;
  output Q4;

  wire CLK1_1;
  wire CLR1_n_1;
  wire D_1;
  wire D_FlipFlop_Set_Reset_0_Q1;
  wire D_FlipFlop_Set_Reset_0_Q1_n;
  wire D_FlipFlop_Set_Reset_0_Q2;
  wire D_FlipFlop_Set_Reset_0_Q2_n;
  wire D_FlipFlop_Set_Reset_1_Q1;
  wire D_FlipFlop_Set_Reset_1_Q1_n;
  wire D_FlipFlop_Set_Reset_1_Q2;
  wire D_FlipFlop_Set_Reset_1_Q2_n;
  wire J1_1;
  wire PR1_n_1;
  wire xup_inv_0_y;
  wire xup_inv_1_y;
  wire xup_inv_2_y;
  wire xup_inv_3_y;
  wire xup_inv_4_y;
  wire xup_nand2_0_y;
  wire xup_nand2_10_y;
  wire xup_nand2_11_y;
  wire xup_nand2_12_y;
  wire xup_nand2_13_y;
  wire xup_nand2_14_y;
  wire xup_nand2_1_y;
  wire xup_nand2_2_y;
  wire xup_nand2_3_y;
  wire xup_nand2_4_y;
  wire xup_nand2_5_y;
  wire xup_nand2_6_y;
  wire xup_nand2_7_y;
  wire xup_nand2_8_y;
  wire xup_nand2_9_y;
  wire xup_nand3_0_y;
  wire xup_nand3_1_y;
  wire xup_nand3_2_y;
  wire xup_nand3_3_y;
  wire xup_nand3_4_y;
  wire xup_nand3_5_y;
  wire xup_nand4_0_y;
  wire xup_nand4_1_y;
  wire xup_nand4_2_y;
  wire xup_xor2_0_y;

  assign CLK1_1 = CLK1;
  assign CLR1_n_1 = CLR1_n;
  assign D_1 = D;
  assign J1_1 = J1;
  assign PR1_n_1 = PR1_n;
  assign Q1 = D_FlipFlop_Set_Reset_0_Q1;
  assign Q2 = D_FlipFlop_Set_Reset_0_Q2;
  assign Q3 = D_FlipFlop_Set_Reset_1_Q1;
  assign Q4 = D_FlipFlop_Set_Reset_1_Q2;
  sy9_D_FlipFlop_Set_Reset_0_0 D_FlipFlop_Set_Reset_0
       (.CLK1(CLK1_1),
        .CLK2(CLK1_1),
        .CLR1_n(CLR1_n_1),
        .CLR2_n(CLR1_n_1),
        .D1(xup_nand2_1_y),
        .D2(xup_nand2_3_y),
        .PR1_n(PR1_n_1),
        .PR2_n(PR1_n_1),
        .Q1(D_FlipFlop_Set_Reset_0_Q1),
        .Q1_n(D_FlipFlop_Set_Reset_0_Q1_n),
        .Q2(D_FlipFlop_Set_Reset_0_Q2),
        .Q2_n(D_FlipFlop_Set_Reset_0_Q2_n));
  sy9_D_FlipFlop_Set_Reset_0_2 D_FlipFlop_Set_Reset_1
       (.CLK1(CLK1_1),
        .CLK2(CLK1_1),
        .CLR1_n(CLR1_n_1),
        .CLR2_n(CLR1_n_1),
        .D1(xup_nand2_7_y),
        .D2(xup_nand2_10_y),
        .PR1_n(PR1_n_1),
        .PR2_n(PR1_n_1),
        .Q1(D_FlipFlop_Set_Reset_1_Q1),
        .Q1_n(D_FlipFlop_Set_Reset_1_Q1_n),
        .Q2(D_FlipFlop_Set_Reset_1_Q2),
        .Q2_n(D_FlipFlop_Set_Reset_1_Q2_n));
  sy9_xup_inv_0_1 xup_inv_0
       (.a(J1_1),
        .y(xup_inv_0_y));
  sy9_xup_inv_0_2 xup_inv_1
       (.a(xup_xor2_0_y),
        .y(xup_inv_1_y));
  sy9_xup_inv_1_0 xup_inv_2
       (.a(xup_nand3_4_y),
        .y(xup_inv_2_y));
  sy9_xup_inv_2_0 xup_inv_3
       (.a(D_1),
        .y(xup_inv_3_y));
  sy9_xup_inv_2_1 xup_inv_4
       (.a(xup_nand2_14_y),
        .y(xup_inv_4_y));
  sy9_xup_nand2_0_0 xup_nand2_0
       (.a(D_FlipFlop_Set_Reset_0_Q1_n),
        .b(J1_1),
        .y(xup_nand2_0_y));
  sy9_xup_nand2_0_3 xup_nand2_1
       (.a(xup_nand2_0_y),
        .b(xup_nand2_2_y),
        .y(xup_nand2_1_y));
  sy9_xup_nand2_7_0 xup_nand2_10
       (.a(xup_nand2_11_y),
        .b(xup_nand2_12_y),
        .y(xup_nand2_10_y));
  sy9_xup_nand2_7_1 xup_nand2_11
       (.a(D_FlipFlop_Set_Reset_1_Q2_n),
        .b(xup_nand2_13_y),
        .y(xup_nand2_11_y));
  sy9_xup_nand2_7_2 xup_nand2_12
       (.a(xup_inv_4_y),
        .b(D_FlipFlop_Set_Reset_1_Q2),
        .y(xup_nand2_12_y));
  sy9_xup_nand2_10_0 xup_nand2_13
       (.a(xup_nand4_0_y),
        .b(xup_nand4_1_y),
        .y(xup_nand2_13_y));
  sy9_xup_nand2_13_0 xup_nand2_14
       (.a(xup_nand3_5_y),
        .b(xup_nand4_2_y),
        .y(xup_nand2_14_y));
  sy9_xup_nand2_0_4 xup_nand2_2
       (.a(xup_inv_0_y),
        .b(D_FlipFlop_Set_Reset_0_Q1),
        .y(xup_nand2_2_y));
  sy9_xup_nand2_1_0 xup_nand2_3
       (.a(xup_nand2_4_y),
        .b(xup_nand2_5_y),
        .y(xup_nand2_3_y));
  sy9_xup_nand2_1_1 xup_nand2_4
       (.a(D_FlipFlop_Set_Reset_0_Q2_n),
        .b(xup_xor2_0_y),
        .y(xup_nand2_4_y));
  sy9_xup_nand2_1_2 xup_nand2_5
       (.a(D_FlipFlop_Set_Reset_0_Q2),
        .b(xup_inv_1_y),
        .y(xup_nand2_5_y));
  sy9_xup_nand2_1_3 xup_nand2_6
       (.a(D_FlipFlop_Set_Reset_1_Q1_n),
        .b(xup_nand3_0_y),
        .y(xup_nand2_6_y));
  sy9_xup_nand2_1_4 xup_nand2_7
       (.a(xup_nand2_6_y),
        .b(xup_nand2_8_y),
        .y(xup_nand2_7_y));
  sy9_xup_nand2_1_5 xup_nand2_8
       (.a(xup_inv_2_y),
        .b(D_FlipFlop_Set_Reset_1_Q1),
        .y(xup_nand2_8_y));
  sy9_xup_nand2_8_0 xup_nand2_9
       (.a(D_FlipFlop_Set_Reset_1_Q1),
        .b(D_FlipFlop_Set_Reset_1_Q2),
        .y(xup_nand2_9_y));
  sy9_xup_nand3_0_4 xup_nand3_0
       (.a(xup_nand3_1_y),
        .b(xup_nand3_2_y),
        .c(xup_nand3_3_y),
        .y(xup_nand3_0_y));
  sy9_xup_nand3_0_5 xup_nand3_1
       (.a(xup_inv_3_y),
        .b(D_FlipFlop_Set_Reset_0_Q1),
        .c(D_FlipFlop_Set_Reset_0_Q2),
        .y(xup_nand3_1_y));
  sy9_xup_nand3_0_6 xup_nand3_2
       (.a(D_1),
        .b(D_FlipFlop_Set_Reset_0_Q1_n),
        .c(D_FlipFlop_Set_Reset_0_Q2_n),
        .y(xup_nand3_2_y));
  sy9_xup_nand3_0_7 xup_nand3_3
       (.a(D_1),
        .b(D_FlipFlop_Set_Reset_0_Q2_n),
        .c(D_FlipFlop_Set_Reset_1_Q2_n),
        .y(xup_nand3_3_y));
  sy9_xup_nand3_0_8 xup_nand3_4
       (.a(xup_nand3_1_y),
        .b(xup_nand3_2_y),
        .c(xup_nand2_9_y),
        .y(xup_nand3_4_y));
  sy9_xup_nand3_3_1 xup_nand3_5
       (.a(xup_inv_3_y),
        .b(D_FlipFlop_Set_Reset_0_Q1_n),
        .c(D_FlipFlop_Set_Reset_1_Q1),
        .y(xup_nand3_5_y));
  sy9_xup_nand4_0_10 xup_nand4_0
       (.a(xup_inv_3_y),
        .b(D_FlipFlop_Set_Reset_0_Q1),
        .c(D_FlipFlop_Set_Reset_0_Q2),
        .d(D_FlipFlop_Set_Reset_1_Q1),
        .y(xup_nand4_0_y));
  sy9_xup_nand4_0_11 xup_nand4_1
       (.a(D_1),
        .b(D_FlipFlop_Set_Reset_0_Q1),
        .c(D_FlipFlop_Set_Reset_0_Q2_n),
        .d(D_FlipFlop_Set_Reset_1_Q1_n),
        .y(xup_nand4_1_y));
  sy9_xup_nand4_1_0 xup_nand4_2
       (.a(D_1),
        .b(D_FlipFlop_Set_Reset_0_Q1_n),
        .c(D_FlipFlop_Set_Reset_0_Q2_n),
        .d(D_FlipFlop_Set_Reset_1_Q1_n),
        .y(xup_nand4_2_y));
  sy9_xup_xor2_0_0 xup_xor2_0
       (.a(D_1),
        .b(D_FlipFlop_Set_Reset_0_Q1),
        .y(xup_xor2_0_y));
endmodule
