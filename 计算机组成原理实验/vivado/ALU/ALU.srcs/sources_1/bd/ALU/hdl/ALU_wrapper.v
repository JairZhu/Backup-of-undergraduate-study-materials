//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
//Date        : Mon May 01 17:38:13 2017
//Host        : surface running 64-bit major release  (build 9200)
//Command     : generate_target ALU_wrapper.bd
//Design      : ALU_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ALU_wrapper
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

  wire OA;
  wire OB;
  wire OC;
  wire OS1;
  wire OS2;
  wire S0;
  wire S1;
  wire S2;
  wire VCC;
  wire Y1;
  wire Y2;
  wire a;
  wire b;
  wire c;
  wire ground;
  wire oS0;

  ALU ALU_i
       (.OA(OA),
        .OB(OB),
        .OC(OC),
        .OS1(OS1),
        .OS2(OS2),
        .S0(S0),
        .S1(S1),
        .S2(S2),
        .VCC(VCC),
        .Y1(Y1),
        .Y2(Y2),
        .a(a),
        .b(b),
        .c(c),
        .ground(ground),
        .oS0(oS0));
endmodule
