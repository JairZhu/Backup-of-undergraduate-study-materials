//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
//Date        : Thu Mar 05 17:39:31 2015
//Host        : LZY-PC running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (GND,
    an,
    clk,
    clr,
    dp,
    seg);
  input GND;
  output [3:0]an;
  input clk;
  input clr;
  output dp;
  output [6:0]seg;

  wire GND;
  wire [3:0]an;
  wire clk;
  wire clr;
  wire dp;
  wire [6:0]seg;

design_1 design_1_i
       (.GND(GND),
        .an(an),
        .clk(clk),
        .clr(clr),
        .dp(dp),
        .seg(seg));
endmodule
