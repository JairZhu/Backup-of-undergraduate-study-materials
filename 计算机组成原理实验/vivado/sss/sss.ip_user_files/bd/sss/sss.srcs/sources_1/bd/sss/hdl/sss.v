//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
//Date        : Mon May 22 18:03:28 2017
//Host        : surface running 64-bit major release  (build 9200)
//Command     : generate_target sss.bd
//Design      : sss
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "sss,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=sss,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "sss.hwdef" *) 
module sss
   (BCD_A,
    BCD_B,
    BCD_C,
    BCD_D,
    BI_RBO_n,
    LT_n,
    RBI_n,
    a,
    a_1,
    a_2,
    a_3,
    a_4,
    b,
    c,
    d,
    e,
    f,
    g,
    y_1,
    y_2,
    y_3,
    y_4);
  input BCD_A;
  input BCD_B;
  input BCD_C;
  input BCD_D;
  inout BI_RBO_n;
  input LT_n;
  input RBI_n;
  input a;
  input a_1;
  input a_2;
  input a_3;
  output a_4;
  output b;
  output c;
  output d;
  output e;
  output f;
  output g;
  output y_1;
  output y_2;
  output y_3;
  output y_4;

  wire BCD2SEG7_0_a;
  wire BCD2SEG7_0_b;
  wire BCD2SEG7_0_c;
  wire BCD2SEG7_0_d;
  wire BCD2SEG7_0_e;
  wire BCD2SEG7_0_f;
  wire BCD2SEG7_0_g;
  wire BCD_A_1;
  wire BCD_B_1;
  wire BCD_C_1;
  wire BCD_D_1;
  wire LT_n_1;
  wire Net;
  wire RBI_n_1;
  wire \^a_1 ;
  wire a_1_1;
  wire a_2_1;
  wire a_3_1;
  wire xup_inv_1_y;
  wire xup_inv_2_y;
  wire xup_inv_3_y;
  wire xup_inv_4_y;

  assign BCD_A_1 = BCD_A;
  assign BCD_B_1 = BCD_B;
  assign BCD_C_1 = BCD_C;
  assign BCD_D_1 = BCD_D;
  assign LT_n_1 = LT_n;
  assign RBI_n_1 = RBI_n;
  assign \^a_1  = a;
  assign a_1_1 = a_1;
  assign a_2_1 = a_2;
  assign a_3_1 = a_3;
  assign a_4 = BCD2SEG7_0_a;
  assign b = BCD2SEG7_0_b;
  assign c = BCD2SEG7_0_c;
  assign d = BCD2SEG7_0_d;
  assign e = BCD2SEG7_0_e;
  assign f = BCD2SEG7_0_f;
  assign g = BCD2SEG7_0_g;
  assign y_1 = xup_inv_1_y;
  assign y_2 = xup_inv_2_y;
  assign y_3 = xup_inv_3_y;
  assign y_4 = xup_inv_4_y;
  sss_BCD2SEG7_0_0 BCD2SEG7_0
       (.BCD_A(BCD_A_1),
        .BCD_B(BCD_B_1),
        .BCD_C(BCD_C_1),
        .BCD_D(BCD_D_1),
        .BI_RBO_n(BI_RBO_n),
        .LT_n(LT_n_1),
        .RBI_n(RBI_n_1),
        .a(BCD2SEG7_0_a),
        .b(BCD2SEG7_0_b),
        .c(BCD2SEG7_0_c),
        .d(BCD2SEG7_0_d),
        .e(BCD2SEG7_0_e),
        .f(BCD2SEG7_0_f),
        .g(BCD2SEG7_0_g));
  sss_xup_inv_0_1 xup_inv_1
       (.a(\^a_1 ),
        .y(xup_inv_1_y));
  sss_xup_inv_0_2 xup_inv_2
       (.a(a_1_1),
        .y(xup_inv_2_y));
  sss_xup_inv_0_3 xup_inv_3
       (.a(a_2_1),
        .y(xup_inv_3_y));
  sss_xup_inv_0_4 xup_inv_4
       (.a(a_3_1),
        .y(xup_inv_4_y));
endmodule
