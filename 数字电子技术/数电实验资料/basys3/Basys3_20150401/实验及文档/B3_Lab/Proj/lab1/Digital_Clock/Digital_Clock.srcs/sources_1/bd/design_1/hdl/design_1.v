//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
//Date        : Thu Mar 05 17:39:31 2015
//Host        : LZY-PC running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1
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

  wire clk_div_0_clk_out;
  wire clk_in1_1;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_clk_out2;
  wire clr_1;
  wire decimal_counter_0_qa;
  wire decimal_counter_0_qb;
  wire decimal_counter_0_qc;
  wire decimal_counter_0_qd;
  wire decimal_counter_1_qa;
  wire decimal_counter_1_qb;
  wire decimal_counter_1_qc;
  wire decimal_counter_1_qd;
  wire decimal_counter_2_qa;
  wire decimal_counter_2_qb;
  wire decimal_counter_2_qc;
  wire decimal_counter_2_qd;
  wire decimal_counter_3_qa;
  wire decimal_counter_3_qb;
  wire decimal_counter_3_qc;
  wire decimal_counter_3_qd;
  wire four_2_input_and_gate_0_y1;
  wire four_2_input_and_gate_0_y2;
  wire r9_1_1;
  wire [6:0]seg7decimal_0_a_to_g;
  wire [3:0]seg7decimal_0_an;
  wire seg7decimal_0_dp;
  wire [15:0]xlconcat_0_dout;

  assign an[3:0] = seg7decimal_0_an;
  assign clk_in1_1 = clk;
  assign clr_1 = clr;
  assign dp = seg7decimal_0_dp;
  assign r9_1_1 = GND;
  assign seg[6:0] = seg7decimal_0_a_to_g;
design_1_clk_div_0_0 clk_div_0
       (.clk_in(clk_wiz_0_clk_out1),
        .clk_out(clk_div_0_clk_out));
design_1_clk_wiz_0_1 clk_wiz_0
       (.clk_in1(clk_in1_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out2(clk_wiz_0_clk_out2));
design_1_decimal_counter_0_0 decimal_counter_0
       (.cp1_n(clk_div_0_clk_out),
        .cp2_n(decimal_counter_0_qa),
        .qa(decimal_counter_0_qa),
        .qb(decimal_counter_0_qb),
        .qc(decimal_counter_0_qc),
        .qd(decimal_counter_0_qd),
        .r0_1(four_2_input_and_gate_0_y1),
        .r0_2(four_2_input_and_gate_0_y1),
        .r9_1(r9_1_1),
        .r9_2(r9_1_1));
design_1_decimal_counter_1_0 decimal_counter_1
       (.cp1_n(decimal_counter_0_qd),
        .cp2_n(decimal_counter_1_qa),
        .qa(decimal_counter_1_qa),
        .qb(decimal_counter_1_qb),
        .qc(decimal_counter_1_qc),
        .qd(decimal_counter_1_qd),
        .r0_1(four_2_input_and_gate_0_y1),
        .r0_2(four_2_input_and_gate_0_y1),
        .r9_1(r9_1_1),
        .r9_2(r9_1_1));
design_1_decimal_counter_2_0 decimal_counter_2
       (.cp1_n(four_2_input_and_gate_0_y1),
        .cp2_n(decimal_counter_2_qa),
        .qa(decimal_counter_2_qa),
        .qb(decimal_counter_2_qb),
        .qc(decimal_counter_2_qc),
        .qd(decimal_counter_2_qd),
        .r0_1(four_2_input_and_gate_0_y2),
        .r0_2(four_2_input_and_gate_0_y2),
        .r9_1(r9_1_1),
        .r9_2(r9_1_1));
design_1_decimal_counter_3_0 decimal_counter_3
       (.cp1_n(decimal_counter_2_qd),
        .cp2_n(decimal_counter_3_qa),
        .qa(decimal_counter_3_qa),
        .qb(decimal_counter_3_qb),
        .qc(decimal_counter_3_qc),
        .qd(decimal_counter_3_qd),
        .r0_1(four_2_input_and_gate_0_y2),
        .r0_2(four_2_input_and_gate_0_y2),
        .r9_1(r9_1_1),
        .r9_2(r9_1_1));
design_1_four_2_input_and_gate_0_0 four_2_input_and_gate_0
       (.a1(decimal_counter_1_qb),
        .a2(decimal_counter_3_qb),
        .a3(r9_1_1),
        .a4(r9_1_1),
        .b1(decimal_counter_1_qc),
        .b2(decimal_counter_3_qc),
        .b3(r9_1_1),
        .b4(r9_1_1),
        .y1(four_2_input_and_gate_0_y1),
        .y2(four_2_input_and_gate_0_y2));
design_1_seg7decimal_0_0 seg7decimal_0
       (.a_to_g(seg7decimal_0_a_to_g),
        .an(seg7decimal_0_an),
        .clk(clk_wiz_0_clk_out2),
        .clr(clr_1),
        .dp(seg7decimal_0_dp),
        .x(xlconcat_0_dout));
design_1_xlconcat_0_1 xlconcat_0
       (.In0(decimal_counter_0_qa),
        .In1(decimal_counter_0_qb),
        .In10(decimal_counter_2_qc),
        .In11(decimal_counter_2_qd),
        .In12(decimal_counter_3_qa),
        .In13(decimal_counter_3_qb),
        .In14(decimal_counter_3_qc),
        .In15(decimal_counter_3_qd),
        .In2(decimal_counter_0_qc),
        .In3(decimal_counter_0_qd),
        .In4(decimal_counter_1_qa),
        .In5(decimal_counter_1_qb),
        .In6(decimal_counter_1_qc),
        .In7(decimal_counter_1_qd),
        .In8(decimal_counter_2_qa),
        .In9(decimal_counter_2_qb),
        .dout(xlconcat_0_dout));
endmodule
