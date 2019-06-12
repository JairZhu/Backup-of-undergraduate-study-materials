// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Fri Nov 17 00:08:00 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_InsMemory_0_0/design_1_InsMemory_0_0_sim_netlist.v
// Design      : design_1_InsMemory_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_InsMemory_0_0,InsMemory,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "InsMemory,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module design_1_InsMemory_0_0
   (IAddress,
    InsMemRW,
    op,
    rs,
    rt,
    rd,
    immediate,
    AJshift,
    sa);
  input [31:0]IAddress;
  input InsMemRW;
  output [5:0]op;
  output [4:0]rs;
  output [4:0]rt;
  output [4:0]rd;
  output [15:0]immediate;
  output [25:0]AJshift;
  output [4:0]sa;

  wire [25:0]\^AJshift ;
  wire \AJshift[15]_INST_0_i_1_n_0 ;
  wire \AJshift[23]_INST_0_i_1_n_0 ;
  wire [31:0]IAddress;
  wire InsMemRW;
  wire g0_b0__0_n_0;
  wire g0_b0__1_n_0;
  wire g0_b0__2_n_0;
  wire g0_b1__0_n_0;
  wire g0_b1__1_n_0;
  wire g0_b1__2_n_0;
  wire g0_b2__0_n_0;
  wire g0_b2__1_n_0;
  wire g0_b2__2_n_0;
  wire g0_b3__0_n_0;
  wire g0_b3__1_n_0;
  wire g0_b3__2_n_0;
  wire g0_b4__0_n_0;
  wire g0_b4__1_n_0;
  wire g0_b4__2_n_0;
  wire g0_b5__0_n_0;
  wire g0_b5__1_n_0;
  wire g0_b5__2_n_0;
  wire g0_b6__0_n_0;
  wire g0_b6__1_n_0;
  wire g0_b6__2_n_0;
  wire g0_b7__0_n_0;
  wire g0_b7__1_n_0;
  wire g0_b7__2_n_0;
  wire g1_b0__0_n_0;
  wire g1_b0__1_n_0;
  wire g1_b0__2_n_0;
  wire g1_b2__0_n_0;
  wire g1_b2__1_n_0;
  wire g1_b2__2_n_0;
  wire g1_b3__0_n_0;
  wire g1_b3__1_n_0;
  wire g1_b3__2_n_0;
  wire g1_b6__0_n_0;
  wire g1_b6__2_n_0;
  wire g1_b6_i_1_n_0;
  wire g1_b6_i_2_n_0;
  wire g1_b6_i_3_n_0;
  wire g1_b6_i_4_n_0;
  wire g1_b6_i_5_n_0;
  wire g1_b6_n_0;
  wire g1_b7__0_i_1_n_0;
  wire g1_b7__0_i_2_n_0;
  wire g1_b7__0_n_0;
  wire g1_b7__1_n_0;
  wire g1_b7__2_n_0;
  wire [5:0]op;
  wire [4:0]sa;
  wire \sa[1]_INST_0_i_1_n_0 ;
  wire [5:1]sel;

  assign AJshift[25:11] = \^AJshift [25:11];
  assign AJshift[10:6] = sa;
  assign AJshift[5:0] = \^AJshift [5:0];
  assign immediate[15:11] = \^AJshift [15:11];
  assign immediate[10:6] = sa;
  assign immediate[5:0] = \^AJshift [5:0];
  assign rd[4:0] = \^AJshift [15:11];
  assign rs[4:0] = \^AJshift [25:21];
  assign rt[4:0] = \^AJshift [20:16];
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[0]_INST_0 
       (.I0(g1_b0__2_n_0),
        .I1(\sa[1]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b0__2_n_0),
        .O(\^AJshift [0]));
  MUXF7 \AJshift[11]_INST_0 
       (.I0(g0_b3__0_n_0),
        .I1(g1_b3__0_n_0),
        .O(\^AJshift [11]),
        .S(\AJshift[15]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \AJshift[12]_INST_0 
       (.I0(g1_b6__2_n_0),
        .I1(\AJshift[15]_INST_0_i_1_n_0 ),
        .I2(g0_b4__0_n_0),
        .O(\^AJshift [12]));
  LUT3 #(
    .INIT(8'hB8)) 
    \AJshift[13]_INST_0 
       (.I0(g1_b7__0_n_0),
        .I1(\AJshift[15]_INST_0_i_1_n_0 ),
        .I2(g0_b5__0_n_0),
        .O(\^AJshift [13]));
  LUT3 #(
    .INIT(8'hB8)) 
    \AJshift[14]_INST_0 
       (.I0(g1_b6__2_n_0),
        .I1(\AJshift[15]_INST_0_i_1_n_0 ),
        .I2(g0_b6__0_n_0),
        .O(\^AJshift [14]));
  LUT3 #(
    .INIT(8'hB8)) 
    \AJshift[15]_INST_0 
       (.I0(g1_b7__0_n_0),
        .I1(\AJshift[15]_INST_0_i_1_n_0 ),
        .I2(g0_b7__0_n_0),
        .O(\^AJshift [15]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \AJshift[15]_INST_0_i_1 
       (.I0(IAddress[4]),
        .I1(IAddress[2]),
        .I2(IAddress[1]),
        .I3(IAddress[3]),
        .I4(IAddress[5]),
        .I5(IAddress[6]),
        .O(\AJshift[15]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[16]_INST_0 
       (.I0(g1_b0__1_n_0),
        .I1(\AJshift[23]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b0__1_n_0),
        .O(\^AJshift [16]));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[17]_INST_0 
       (.I0(g1_b2__1_n_0),
        .I1(\AJshift[23]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b1__1_n_0),
        .O(\^AJshift [17]));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[18]_INST_0 
       (.I0(g1_b2__1_n_0),
        .I1(\AJshift[23]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b2__1_n_0),
        .O(\^AJshift [18]));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[19]_INST_0 
       (.I0(g1_b3__1_n_0),
        .I1(\AJshift[23]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b3__1_n_0),
        .O(\^AJshift [19]));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[1]_INST_0 
       (.I0(g1_b2__2_n_0),
        .I1(\sa[1]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b1__2_n_0),
        .O(\^AJshift [1]));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[20]_INST_0 
       (.I0(g1_b6__0_n_0),
        .I1(\AJshift[23]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b4__1_n_0),
        .O(\^AJshift [20]));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[21]_INST_0 
       (.I0(g1_b7__1_n_0),
        .I1(\AJshift[23]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b5__1_n_0),
        .O(\^AJshift [21]));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[22]_INST_0 
       (.I0(g1_b6__0_n_0),
        .I1(\AJshift[23]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b6__1_n_0),
        .O(\^AJshift [22]));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[23]_INST_0 
       (.I0(g1_b7__1_n_0),
        .I1(\AJshift[23]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b7__1_n_0),
        .O(\^AJshift [23]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \AJshift[23]_INST_0_i_1 
       (.I0(IAddress[4]),
        .I1(IAddress[2]),
        .I2(IAddress[0]),
        .I3(IAddress[1]),
        .I4(IAddress[3]),
        .O(\AJshift[23]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[2]_INST_0 
       (.I0(g1_b2__2_n_0),
        .I1(\sa[1]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b2__2_n_0),
        .O(\^AJshift [2]));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[3]_INST_0 
       (.I0(g1_b3__2_n_0),
        .I1(\sa[1]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b3__2_n_0),
        .O(\^AJshift [3]));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[4]_INST_0 
       (.I0(g1_b6_n_0),
        .I1(\sa[1]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b4__2_n_0),
        .O(\^AJshift [4]));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \AJshift[5]_INST_0 
       (.I0(g1_b7__2_n_0),
        .I1(\sa[1]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b5__2_n_0),
        .O(\^AJshift [5]));
  LUT6 #(
    .INIT(64'h1208A84020608800)) 
    g0_b0__0
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(IAddress[0]),
        .I4(g1_b7__0_i_1_n_0),
        .I5(g1_b7__0_i_2_n_0),
        .O(g0_b0__0_n_0));
  LUT6 #(
    .INIT(64'h06109101B0000101)) 
    g0_b0__1
       (.I0(IAddress[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[5]),
        .O(g0_b0__1_n_0));
  LUT6 #(
    .INIT(64'h06109101B0000101)) 
    g0_b0__2
       (.I0(IAddress[0]),
        .I1(g1_b6_i_1_n_0),
        .I2(g1_b6_i_2_n_0),
        .I3(g1_b6_i_3_n_0),
        .I4(g1_b6_i_4_n_0),
        .I5(g1_b6_i_5_n_0),
        .O(g0_b0__2_n_0));
  LUT6 #(
    .INIT(64'h80004840C2402600)) 
    g0_b1__0
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(IAddress[0]),
        .I4(g1_b7__0_i_1_n_0),
        .I5(g1_b7__0_i_2_n_0),
        .O(g0_b1__0_n_0));
  LUT6 #(
    .INIT(64'h0001C100C0111050)) 
    g0_b1__1
       (.I0(IAddress[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[5]),
        .O(g0_b1__1_n_0));
  LUT6 #(
    .INIT(64'h0001C100C0111050)) 
    g0_b1__2
       (.I0(IAddress[0]),
        .I1(g1_b6_i_1_n_0),
        .I2(g1_b6_i_2_n_0),
        .I3(g1_b6_i_3_n_0),
        .I4(g1_b6_i_4_n_0),
        .I5(g1_b6_i_5_n_0),
        .O(g0_b1__2_n_0));
  LUT6 #(
    .INIT(64'h052A4840406A0002)) 
    g0_b2__0
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(IAddress[0]),
        .I4(g1_b7__0_i_1_n_0),
        .I5(g1_b7__0_i_2_n_0),
        .O(g0_b2__0_n_0));
  LUT6 #(
    .INIT(64'h2264C100E2200020)) 
    g0_b2__1
       (.I0(IAddress[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[5]),
        .O(g0_b2__1_n_0));
  LUT6 #(
    .INIT(64'h2264C100E2200020)) 
    g0_b2__2
       (.I0(IAddress[0]),
        .I1(g1_b6_i_1_n_0),
        .I2(g1_b6_i_2_n_0),
        .I3(g1_b6_i_3_n_0),
        .I4(g1_b6_i_4_n_0),
        .I5(g1_b6_i_5_n_0),
        .O(g0_b2__2_n_0));
  LUT6 #(
    .INIT(64'h022A50C648400172)) 
    g0_b3__0
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(IAddress[0]),
        .I4(g1_b7__0_i_1_n_0),
        .I5(g1_b7__0_i_2_n_0),
        .O(g0_b3__0_n_0));
  LUT6 #(
    .INIT(64'h2230C4A2C100A824)) 
    g0_b3__1
       (.I0(IAddress[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[5]),
        .O(g0_b3__1_n_0));
  LUT6 #(
    .INIT(64'h2230C4A2C100A824)) 
    g0_b3__2
       (.I0(IAddress[0]),
        .I1(g1_b6_i_1_n_0),
        .I2(g1_b6_i_2_n_0),
        .I3(g1_b6_i_3_n_0),
        .I4(g1_b6_i_4_n_0),
        .I5(g1_b6_i_5_n_0),
        .O(g0_b3__2_n_0));
  LUT6 #(
    .INIT(64'h00A8406540EA0012)) 
    g0_b4__0
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(IAddress[0]),
        .I4(g1_b7__0_i_1_n_0),
        .I5(g1_b7__0_i_2_n_0),
        .O(g0_b4__0_n_0));
  LUT6 #(
    .INIT(64'h2202E088E2220820)) 
    g0_b4__1
       (.I0(IAddress[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[5]),
        .O(g0_b4__1_n_0));
  LUT6 #(
    .INIT(64'h2202E088E2220820)) 
    g0_b4__2
       (.I0(IAddress[0]),
        .I1(g1_b6_i_1_n_0),
        .I2(g1_b6_i_2_n_0),
        .I3(g1_b6_i_3_n_0),
        .I4(g1_b6_i_4_n_0),
        .I5(g1_b6_i_5_n_0),
        .O(g0_b4__2_n_0));
  LUT6 #(
    .INIT(64'h8AA068CFC04920C0)) 
    g0_b5__0
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(IAddress[0]),
        .I4(g1_b7__0_i_1_n_0),
        .I5(g1_b7__0_i_2_n_0),
        .O(g0_b5__0_n_0));
  LUT6 #(
    .INIT(64'h2113D3AAC2099002)) 
    g0_b5__1
       (.I0(IAddress[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[5]),
        .O(g0_b5__1_n_0));
  LUT6 #(
    .INIT(64'h2113D3AAC2099002)) 
    g0_b5__2
       (.I0(IAddress[0]),
        .I1(g1_b6_i_1_n_0),
        .I2(g1_b6_i_2_n_0),
        .I3(g1_b6_i_3_n_0),
        .I4(g1_b6_i_4_n_0),
        .I5(g1_b6_i_5_n_0),
        .O(g0_b5__2_n_0));
  LUT6 #(
    .INIT(64'h0020EA4050542800)) 
    g0_b6__0
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(IAddress[0]),
        .I4(g1_b7__0_i_1_n_0),
        .I5(g1_b7__0_i_2_n_0),
        .O(g0_b6__0_n_0));
  LUT6 #(
    .INIT(64'h2000D111CC801100)) 
    g0_b6__1
       (.I0(IAddress[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[5]),
        .O(g0_b6__1_n_0));
  LUT6 #(
    .INIT(64'h2000D111CC801100)) 
    g0_b6__2
       (.I0(IAddress[0]),
        .I1(g1_b6_i_1_n_0),
        .I2(g1_b6_i_2_n_0),
        .I3(g1_b6_i_3_n_0),
        .I4(g1_b6_i_4_n_0),
        .I5(g1_b6_i_5_n_0),
        .O(g0_b6__2_n_0));
  LUT6 #(
    .INIT(64'h00A26ACAC2CA00AA)) 
    g0_b7__0
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(IAddress[0]),
        .I4(g1_b7__0_i_1_n_0),
        .I5(g1_b7__0_i_2_n_0),
        .O(g0_b7__0_n_0));
  LUT6 #(
    .INIT(64'h2022D332C2332222)) 
    g0_b7__1
       (.I0(IAddress[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[5]),
        .O(g0_b7__1_n_0));
  LUT6 #(
    .INIT(64'h2022D332C2332222)) 
    g0_b7__2
       (.I0(IAddress[0]),
        .I1(g1_b6_i_1_n_0),
        .I2(g1_b6_i_2_n_0),
        .I3(g1_b6_i_3_n_0),
        .I4(g1_b6_i_4_n_0),
        .I5(g1_b6_i_5_n_0),
        .O(g0_b7__2_n_0));
  LUT6 #(
    .INIT(64'h0000000000008101)) 
    g1_b0__0
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(IAddress[0]),
        .I4(g1_b7__0_i_1_n_0),
        .I5(g1_b7__0_i_2_n_0),
        .O(g1_b0__0_n_0));
  LUT6 #(
    .INIT(64'h000000000000000D)) 
    g1_b0__1
       (.I0(IAddress[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[5]),
        .O(g1_b0__1_n_0));
  LUT6 #(
    .INIT(64'h000000000000000D)) 
    g1_b0__2
       (.I0(IAddress[0]),
        .I1(g1_b6_i_1_n_0),
        .I2(g1_b6_i_2_n_0),
        .I3(g1_b6_i_3_n_0),
        .I4(g1_b6_i_4_n_0),
        .I5(g1_b6_i_5_n_0),
        .O(g1_b0__2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000501)) 
    g1_b2__0
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(IAddress[0]),
        .I4(g1_b7__0_i_1_n_0),
        .I5(g1_b7__0_i_2_n_0),
        .O(g1_b2__0_n_0));
  LUT6 #(
    .INIT(64'h000000000000004C)) 
    g1_b2__1
       (.I0(IAddress[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[5]),
        .O(g1_b2__1_n_0));
  LUT6 #(
    .INIT(64'h000000000000004C)) 
    g1_b2__2
       (.I0(IAddress[0]),
        .I1(g1_b6_i_1_n_0),
        .I2(g1_b6_i_2_n_0),
        .I3(g1_b6_i_3_n_0),
        .I4(g1_b6_i_4_n_0),
        .I5(g1_b6_i_5_n_0),
        .O(g1_b2__2_n_0));
  LUT6 #(
    .INIT(64'h0000000000008503)) 
    g1_b3__0
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(IAddress[0]),
        .I4(g1_b7__0_i_1_n_0),
        .I5(g1_b7__0_i_2_n_0),
        .O(g1_b3__0_n_0));
  LUT6 #(
    .INIT(64'h000000000000006D)) 
    g1_b3__1
       (.I0(IAddress[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[5]),
        .O(g1_b3__1_n_0));
  LUT6 #(
    .INIT(64'h000000000000006D)) 
    g1_b3__2
       (.I0(IAddress[0]),
        .I1(g1_b6_i_1_n_0),
        .I2(g1_b6_i_2_n_0),
        .I3(g1_b6_i_3_n_0),
        .I4(g1_b6_i_4_n_0),
        .I5(g1_b6_i_5_n_0),
        .O(g1_b3__2_n_0));
  LUT5 #(
    .INIT(32'h00000002)) 
    g1_b6
       (.I0(g1_b6_i_1_n_0),
        .I1(g1_b6_i_2_n_0),
        .I2(g1_b6_i_3_n_0),
        .I3(g1_b6_i_4_n_0),
        .I4(g1_b6_i_5_n_0),
        .O(g1_b6_n_0));
  LUT5 #(
    .INIT(32'h00000002)) 
    g1_b6__0
       (.I0(sel[1]),
        .I1(sel[2]),
        .I2(sel[3]),
        .I3(sel[4]),
        .I4(sel[5]),
        .O(g1_b6__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    g1_b6__0_i_1
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .O(sel[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h78)) 
    g1_b6__0_i_2
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .O(sel[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    g1_b6__0_i_3
       (.I0(IAddress[1]),
        .I1(IAddress[0]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .O(sel[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    g1_b6__0_i_4
       (.I0(IAddress[2]),
        .I1(IAddress[0]),
        .I2(IAddress[1]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .O(sel[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    g1_b6__0_i_5
       (.I0(IAddress[3]),
        .I1(IAddress[1]),
        .I2(IAddress[0]),
        .I3(IAddress[2]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(sel[5]));
  LUT5 #(
    .INIT(32'h00000001)) 
    g1_b6__2
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(g1_b7__0_i_1_n_0),
        .I4(g1_b7__0_i_2_n_0),
        .O(g1_b6__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h9)) 
    g1_b6_i_1
       (.I0(IAddress[1]),
        .I1(IAddress[0]),
        .O(g1_b6_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h1E)) 
    g1_b6_i_2
       (.I0(IAddress[1]),
        .I1(IAddress[0]),
        .I2(IAddress[2]),
        .O(g1_b6_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    g1_b6_i_3
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .O(g1_b6_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h57FFA800)) 
    g1_b6_i_4
       (.I0(IAddress[2]),
        .I1(IAddress[1]),
        .I2(IAddress[0]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .O(g1_b6_i_4_n_0));
  LUT6 #(
    .INIT(64'h57FFFFFFA8000000)) 
    g1_b6_i_5
       (.I0(IAddress[3]),
        .I1(IAddress[0]),
        .I2(IAddress[1]),
        .I3(IAddress[2]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(g1_b6_i_5_n_0));
  LUT6 #(
    .INIT(64'h0000000000000181)) 
    g1_b7__0
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(IAddress[0]),
        .I4(g1_b7__0_i_1_n_0),
        .I5(g1_b7__0_i_2_n_0),
        .O(g1_b7__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    g1_b7__0_i_1
       (.I0(IAddress[2]),
        .I1(IAddress[1]),
        .I2(IAddress[3]),
        .I3(IAddress[4]),
        .O(g1_b7__0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    g1_b7__0_i_2
       (.I0(IAddress[3]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[4]),
        .I4(IAddress[5]),
        .O(g1_b7__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h000000000000000E)) 
    g1_b7__1
       (.I0(IAddress[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[5]),
        .O(g1_b7__1_n_0));
  LUT6 #(
    .INIT(64'h000000000000000E)) 
    g1_b7__2
       (.I0(IAddress[0]),
        .I1(g1_b6_i_1_n_0),
        .I2(g1_b6_i_2_n_0),
        .I3(g1_b6_i_3_n_0),
        .I4(g1_b6_i_4_n_0),
        .I5(g1_b6_i_5_n_0),
        .O(g1_b7__2_n_0));
  design_1_InsMemory_0_0_InsMemory inst
       (.IAddress(IAddress[6:0]),
        .InsMemRW(InsMemRW),
        .Q({op,\^AJshift [25:24]}));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \sa[0]_INST_0 
       (.I0(g1_b6_n_0),
        .I1(\sa[1]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b6__2_n_0),
        .O(sa[0]));
  LUT5 #(
    .INIT(32'hEABF2A80)) 
    \sa[1]_INST_0 
       (.I0(g1_b7__2_n_0),
        .I1(\sa[1]_INST_0_i_1_n_0 ),
        .I2(IAddress[5]),
        .I3(IAddress[6]),
        .I4(g0_b7__2_n_0),
        .O(sa[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h88800000)) 
    \sa[1]_INST_0_i_1 
       (.I0(IAddress[4]),
        .I1(IAddress[2]),
        .I2(IAddress[1]),
        .I3(IAddress[0]),
        .I4(IAddress[3]),
        .O(\sa[1]_INST_0_i_1_n_0 ));
  MUXF7 \sa[2]_INST_0 
       (.I0(g0_b0__0_n_0),
        .I1(g1_b0__0_n_0),
        .O(sa[2]),
        .S(\AJshift[15]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sa[3]_INST_0 
       (.I0(g1_b2__0_n_0),
        .I1(\AJshift[15]_INST_0_i_1_n_0 ),
        .I2(g0_b1__0_n_0),
        .O(sa[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sa[4]_INST_0 
       (.I0(g1_b2__0_n_0),
        .I1(\AJshift[15]_INST_0_i_1_n_0 ),
        .I2(g0_b2__0_n_0),
        .O(sa[4]));
endmodule

(* ORIG_REF_NAME = "InsMemory" *) 
module design_1_InsMemory_0_0_InsMemory
   (Q,
    InsMemRW,
    IAddress);
  output [7:0]Q;
  input InsMemRW;
  input [6:0]IAddress;

  wire [6:0]IAddress;
  wire [7:0]InsDataOut0;
  wire InsMemRW;
  wire [7:0]Q;
  wire g0_b0_n_0;
  wire g0_b1_n_0;
  wire g0_b2_n_0;
  wire g0_b3_n_0;
  wire g0_b4_n_0;
  wire g0_b5_n_0;
  wire g0_b6_n_0;
  wire g0_b7_n_0;
  wire g1_b0_n_0;
  wire g1_b2_n_0;
  wire g1_b3_n_0;
  wire g1_b6__1_n_0;
  wire g1_b7_n_0;

  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \InsDataOut_reg[24] 
       (.CLR(1'b0),
        .D(InsDataOut0[0]),
        .G(InsMemRW),
        .GE(1'b1),
        .Q(Q[0]));
  MUXF7 \InsDataOut_reg[24]_i_1 
       (.I0(g0_b0_n_0),
        .I1(g1_b0_n_0),
        .O(InsDataOut0[0]),
        .S(IAddress[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \InsDataOut_reg[25] 
       (.CLR(1'b0),
        .D(InsDataOut0[1]),
        .G(InsMemRW),
        .GE(1'b1),
        .Q(Q[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \InsDataOut_reg[25]_i_1 
       (.I0(g1_b2_n_0),
        .I1(IAddress[6]),
        .I2(g0_b1_n_0),
        .O(InsDataOut0[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \InsDataOut_reg[26] 
       (.CLR(1'b0),
        .D(InsDataOut0[2]),
        .G(InsMemRW),
        .GE(1'b1),
        .Q(Q[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \InsDataOut_reg[26]_i_1 
       (.I0(g1_b2_n_0),
        .I1(IAddress[6]),
        .I2(g0_b2_n_0),
        .O(InsDataOut0[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \InsDataOut_reg[27] 
       (.CLR(1'b0),
        .D(InsDataOut0[3]),
        .G(InsMemRW),
        .GE(1'b1),
        .Q(Q[3]));
  MUXF7 \InsDataOut_reg[27]_i_1 
       (.I0(g0_b3_n_0),
        .I1(g1_b3_n_0),
        .O(InsDataOut0[3]),
        .S(IAddress[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \InsDataOut_reg[28] 
       (.CLR(1'b0),
        .D(InsDataOut0[4]),
        .G(InsMemRW),
        .GE(1'b1),
        .Q(Q[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \InsDataOut_reg[28]_i_1 
       (.I0(g1_b6__1_n_0),
        .I1(IAddress[6]),
        .I2(g0_b4_n_0),
        .O(InsDataOut0[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \InsDataOut_reg[29] 
       (.CLR(1'b0),
        .D(InsDataOut0[5]),
        .G(InsMemRW),
        .GE(1'b1),
        .Q(Q[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \InsDataOut_reg[29]_i_1 
       (.I0(g1_b7_n_0),
        .I1(IAddress[6]),
        .I2(g0_b5_n_0),
        .O(InsDataOut0[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \InsDataOut_reg[30] 
       (.CLR(1'b0),
        .D(InsDataOut0[6]),
        .G(InsMemRW),
        .GE(1'b1),
        .Q(Q[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \InsDataOut_reg[30]_i_1 
       (.I0(g1_b6__1_n_0),
        .I1(IAddress[6]),
        .I2(g0_b6_n_0),
        .O(InsDataOut0[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \InsDataOut_reg[31] 
       (.CLR(1'b0),
        .D(InsDataOut0[7]),
        .G(InsMemRW),
        .GE(1'b1),
        .Q(Q[7]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \InsDataOut_reg[31]_i_1 
       (.I0(g1_b7_n_0),
        .I1(IAddress[6]),
        .I2(g0_b7_n_0),
        .O(InsDataOut0[7]));
  LUT6 #(
    .INIT(64'h0920620270000202)) 
    g0_b0
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(g0_b0_n_0));
  LUT6 #(
    .INIT(64'h0002C200C02220A0)) 
    g0_b1
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(g0_b1_n_0));
  LUT6 #(
    .INIT(64'h1198C200D1100010)) 
    g0_b2
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(g0_b2_n_0));
  LUT6 #(
    .INIT(64'h1130C851C2005418)) 
    g0_b3
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(g0_b3_n_0));
  LUT6 #(
    .INIT(64'h1101D044D1110410)) 
    g0_b4
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(g0_b4_n_0));
  LUT6 #(
    .INIT(64'h1223E355C1066001)) 
    g0_b5
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(g0_b5_n_0));
  LUT6 #(
    .INIT(64'h1000E222CC402200)) 
    g0_b6
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(g0_b6_n_0));
  LUT6 #(
    .INIT(64'h1011E331C1331111)) 
    g0_b7
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(g0_b7_n_0));
  LUT6 #(
    .INIT(64'h000000000000000E)) 
    g1_b0
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(g1_b0_n_0));
  LUT6 #(
    .INIT(64'h000000000000008C)) 
    g1_b2
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(g1_b2_n_0));
  LUT6 #(
    .INIT(64'h000000000000009E)) 
    g1_b3
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(g1_b3_n_0));
  LUT5 #(
    .INIT(32'h00000002)) 
    g1_b6__1
       (.I0(IAddress[1]),
        .I1(IAddress[2]),
        .I2(IAddress[3]),
        .I3(IAddress[4]),
        .I4(IAddress[5]),
        .O(g1_b6__1_n_0));
  LUT6 #(
    .INIT(64'h000000000000000D)) 
    g1_b7
       (.I0(IAddress[0]),
        .I1(IAddress[1]),
        .I2(IAddress[2]),
        .I3(IAddress[3]),
        .I4(IAddress[4]),
        .I5(IAddress[5]),
        .O(g1_b7_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
