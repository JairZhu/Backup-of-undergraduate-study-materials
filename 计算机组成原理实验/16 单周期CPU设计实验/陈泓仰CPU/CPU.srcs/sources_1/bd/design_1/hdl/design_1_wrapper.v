//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
//Date        : Sun Nov 19 17:12:45 2017
//Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (CLK,
    Reset,
    Switch,
    a_to_g,
    clr,
    control,
    pos,
    rst);
  input CLK;
  input Reset;
  input Switch;
  output [6:0]a_to_g;
  input clr;
  input [1:0]control;
  output [3:0]pos;
  input rst;

  wire CLK;
  wire Reset;
  wire Switch;
  wire [6:0]a_to_g;
  wire clr;
  wire [1:0]control;
  wire [3:0]pos;
  wire rst;

  design_1 design_1_i
       (.CLK(CLK),
        .Reset(Reset),
        .Switch(Switch),
        .a_to_g(a_to_g),
        .clr(clr),
        .control(control),
        .pos(pos),
        .rst(rst));
endmodule
