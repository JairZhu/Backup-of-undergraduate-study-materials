//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
//Date        : Mon May 22 18:03:28 2017
//Host        : surface running 64-bit major release  (build 9200)
//Command     : generate_target sss_wrapper.bd
//Design      : sss_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module sss_wrapper
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

  wire BCD_A;
  wire BCD_B;
  wire BCD_C;
  wire BCD_D;
  wire BI_RBO_n;
  wire LT_n;
  wire RBI_n;
  wire a;
  wire a_1;
  wire a_2;
  wire a_3;
  wire a_4;
  wire b;
  wire c;
  wire d;
  wire e;
  wire f;
  wire g;
  wire y_1;
  wire y_2;
  wire y_3;
  wire y_4;

  sss sss_i
       (.BCD_A(BCD_A),
        .BCD_B(BCD_B),
        .BCD_C(BCD_C),
        .BCD_D(BCD_D),
        .BI_RBO_n(BI_RBO_n),
        .LT_n(LT_n),
        .RBI_n(RBI_n),
        .a(a),
        .a_1(a_1),
        .a_2(a_2),
        .a_3(a_3),
        .a_4(a_4),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .y_1(y_1),
        .y_2(y_2),
        .y_3(y_3),
        .y_4(y_4));
endmodule
