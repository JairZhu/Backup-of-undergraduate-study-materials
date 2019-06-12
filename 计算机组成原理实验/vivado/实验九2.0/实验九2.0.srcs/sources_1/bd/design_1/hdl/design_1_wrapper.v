//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
//Date        : Tue May 30 20:24:18 2017
//Host        : surface running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (CLK1,
    CLR1_n,
    D,
    PR1_n,
    Q1,
    Q2,
    Q3,
    Q4,
    high);
  input CLK1;
  input CLR1_n;
  input D;
  input PR1_n;
  output Q1;
  output Q2;
  output Q3;
  output Q4;
  input high;

  wire CLK1;
  wire CLR1_n;
  wire D;
  wire PR1_n;
  wire Q1;
  wire Q2;
  wire Q3;
  wire Q4;
  wire high;

  design_1 design_1_i
       (.CLK1(CLK1),
        .CLR1_n(CLR1_n),
        .D(D),
        .PR1_n(PR1_n),
        .Q1(Q1),
        .Q2(Q2),
        .Q3(Q3),
        .Q4(Q4),
        .high(high));
endmodule
