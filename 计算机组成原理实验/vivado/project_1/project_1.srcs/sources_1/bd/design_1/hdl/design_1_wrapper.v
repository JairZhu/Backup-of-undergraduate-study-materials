//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
//Date        : Mon Nov 20 11:14:07 2017
//Host        : XiaoXin running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (A,
    B,
    r);
  input A;
  input B;
  output r;

  wire A;
  wire B;
  wire r;

  design_1 design_1_i
       (.A(A),
        .B(B),
        .r(r));
endmodule
