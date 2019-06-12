//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
//Date        : Tue May 30 20:03:31 2017
//Host        : surface running 64-bit major release  (build 9200)
//Command     : generate_target sy9_wrapper.bd
//Design      : sy9_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module sy9_wrapper
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

  wire CLK1;
  wire CLR1_n;
  wire D;
  wire J1;
  wire PR1_n;
  wire Q1;
  wire Q2;
  wire Q3;
  wire Q4;

  sy9 sy9_i
       (.CLK1(CLK1),
        .CLR1_n(CLR1_n),
        .D(D),
        .J1(J1),
        .PR1_n(PR1_n),
        .Q1(Q1),
        .Q2(Q2),
        .Q3(Q3),
        .Q4(Q4));
endmodule
