// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Sun Nov 12 16:55:04 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_ALU_0_0_sim_netlist.v
// Design      : design_1_ALU_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ALU
   (Result,
    Zero,
    A,
    B,
    AluOp,
    A_4__s_port_,
    A_18__s_port_,
    A_26__s_port_,
    A_2__s_port_,
    A_10__s_port_,
    A_16__s_port_,
    A_24__s_port_,
    A_0__s_port_,
    A_8__s_port_,
    p_4_in,
    data2,
    O,
    A_14__s_port_,
    \B[0] ,
    \A[14]_0 ,
    \A[14]_1 ,
    \A[14]_2 ,
    B_4__s_port_,
    \A[14]_3 ,
    \B[0]_0 ,
    B_5__s_port_,
    \A[14]_4 ,
    B_6__s_port_,
    \A[14]_5 ,
    B_7__s_port_,
    \A[14]_6 ,
    \A[14]_7 ,
    \B[0]_1 ,
    \A[14]_8 ,
    \A[14]_9 ,
    \A[14]_10 ,
    B_12__s_port_,
    \A[14]_11 ,
    \B[0]_2 ,
    B_13__s_port_,
    \A[14]_12 ,
    B_14__s_port_,
    \A[14]_13 ,
    B_15__s_port_,
    \A[14]_14 ,
    \A[14]_15 ,
    \B[0]_3 ,
    \A[14]_16 ,
    \A[14]_17 ,
    \A[14]_18 ,
    \A[14]_19 ,
    \B[0]_4 ,
    \A[14]_20 ,
    B_22__s_port_,
    \A[14]_21 ,
    B_23__s_port_,
    \A[14]_22 ,
    \A[14]_23 ,
    \B[0]_5 ,
    \A[14]_24 ,
    \A[14]_25 ,
    \A[14]_26 ,
    \A[14]_27 ,
    \A[14]_28 ,
    \A[14]_29 ,
    \B[0]_6 ,
    \B[12]_0 );
  output [31:0]Result;
  output Zero;
  input [31:0]A;
  input [31:0]B;
  input [2:0]AluOp;
  input A_4__s_port_;
  input A_18__s_port_;
  input A_26__s_port_;
  input A_2__s_port_;
  input A_10__s_port_;
  input A_16__s_port_;
  input A_24__s_port_;
  input A_0__s_port_;
  input A_8__s_port_;
  input p_4_in;
  input data2;
  input [3:0]O;
  input A_14__s_port_;
  input [3:0]\B[0] ;
  input \A[14]_0 ;
  input \A[14]_1 ;
  input \A[14]_2 ;
  input B_4__s_port_;
  input \A[14]_3 ;
  input [3:0]\B[0]_0 ;
  input B_5__s_port_;
  input \A[14]_4 ;
  input B_6__s_port_;
  input \A[14]_5 ;
  input B_7__s_port_;
  input \A[14]_6 ;
  input \A[14]_7 ;
  input [3:0]\B[0]_1 ;
  input \A[14]_8 ;
  input \A[14]_9 ;
  input \A[14]_10 ;
  input B_12__s_port_;
  input \A[14]_11 ;
  input [3:0]\B[0]_2 ;
  input B_13__s_port_;
  input \A[14]_12 ;
  input B_14__s_port_;
  input \A[14]_13 ;
  input B_15__s_port_;
  input \A[14]_14 ;
  input \A[14]_15 ;
  input [3:0]\B[0]_3 ;
  input \A[14]_16 ;
  input \A[14]_17 ;
  input \A[14]_18 ;
  input \A[14]_19 ;
  input [3:0]\B[0]_4 ;
  input \A[14]_20 ;
  input B_22__s_port_;
  input \A[14]_21 ;
  input B_23__s_port_;
  input \A[14]_22 ;
  input \A[14]_23 ;
  input [3:0]\B[0]_5 ;
  input \A[14]_24 ;
  input \A[14]_25 ;
  input \A[14]_26 ;
  input \A[14]_27 ;
  input \A[14]_28 ;
  input \A[14]_29 ;
  input \B[0]_6 ;
  input \B[12]_0 ;

  wire [31:0]A;
  wire \A[14]_0 ;
  wire \A[14]_1 ;
  wire \A[14]_10 ;
  wire \A[14]_11 ;
  wire \A[14]_12 ;
  wire \A[14]_13 ;
  wire \A[14]_14 ;
  wire \A[14]_15 ;
  wire \A[14]_16 ;
  wire \A[14]_17 ;
  wire \A[14]_18 ;
  wire \A[14]_19 ;
  wire \A[14]_2 ;
  wire \A[14]_20 ;
  wire \A[14]_21 ;
  wire \A[14]_22 ;
  wire \A[14]_23 ;
  wire \A[14]_24 ;
  wire \A[14]_25 ;
  wire \A[14]_26 ;
  wire \A[14]_27 ;
  wire \A[14]_28 ;
  wire \A[14]_29 ;
  wire \A[14]_3 ;
  wire \A[14]_4 ;
  wire \A[14]_5 ;
  wire \A[14]_6 ;
  wire \A[14]_7 ;
  wire \A[14]_8 ;
  wire \A[14]_9 ;
  wire A_0__s_net_1;
  wire A_10__s_net_1;
  wire A_14__s_net_1;
  wire A_16__s_net_1;
  wire A_18__s_net_1;
  wire A_24__s_net_1;
  wire A_26__s_net_1;
  wire A_2__s_net_1;
  wire A_4__s_net_1;
  wire A_8__s_net_1;
  wire [2:0]AluOp;
  wire [31:0]B;
  wire [3:0]\B[0] ;
  wire [3:0]\B[0]_0 ;
  wire [3:0]\B[0]_1 ;
  wire [3:0]\B[0]_2 ;
  wire [3:0]\B[0]_3 ;
  wire [3:0]\B[0]_4 ;
  wire [3:0]\B[0]_5 ;
  wire \B[0]_6 ;
  wire \B[12]_0 ;
  wire B_12__s_net_1;
  wire B_13__s_net_1;
  wire B_14__s_net_1;
  wire B_15__s_net_1;
  wire B_22__s_net_1;
  wire B_23__s_net_1;
  wire B_4__s_net_1;
  wire B_5__s_net_1;
  wire B_6__s_net_1;
  wire B_7__s_net_1;
  wire [3:0]O;
  wire [31:0]Result;
  wire \Result[0]_INST_0_i_1_n_0 ;
  wire \Result[0]_INST_0_i_2_n_0 ;
  wire \Result[10]_INST_0_i_1_n_0 ;
  wire \Result[11]_INST_0_i_1_n_0 ;
  wire \Result[12]_INST_0_i_1_n_0 ;
  wire \Result[13]_INST_0_i_1_n_0 ;
  wire \Result[14]_INST_0_i_1_n_0 ;
  wire \Result[15]_INST_0_i_1_n_0 ;
  wire \Result[16]_INST_0_i_1_n_0 ;
  wire \Result[17]_INST_0_i_1_n_0 ;
  wire \Result[18]_INST_0_i_1_n_0 ;
  wire \Result[19]_INST_0_i_1_n_0 ;
  wire \Result[1]_INST_0_i_1_n_0 ;
  wire \Result[20]_INST_0_i_1_n_0 ;
  wire \Result[21]_INST_0_i_1_n_0 ;
  wire \Result[22]_INST_0_i_1_n_0 ;
  wire \Result[23]_INST_0_i_1_n_0 ;
  wire \Result[24]_INST_0_i_1_n_0 ;
  wire \Result[25]_INST_0_i_1_n_0 ;
  wire \Result[26]_INST_0_i_1_n_0 ;
  wire \Result[27]_INST_0_i_1_n_0 ;
  wire \Result[28]_INST_0_i_1_n_0 ;
  wire \Result[29]_INST_0_i_1_n_0 ;
  wire \Result[2]_INST_0_i_1_n_0 ;
  wire \Result[30]_INST_0_i_1_n_0 ;
  wire \Result[31]_INST_0_i_1_n_0 ;
  wire \Result[3]_INST_0_i_1_n_0 ;
  wire \Result[4]_INST_0_i_1_n_0 ;
  wire \Result[5]_INST_0_i_1_n_0 ;
  wire \Result[6]_INST_0_i_1_n_0 ;
  wire \Result[7]_INST_0_i_1_n_0 ;
  wire \Result[8]_INST_0_i_1_n_0 ;
  wire \Result[9]_INST_0_i_1_n_0 ;
  wire Zero;
  wire Zero2_carry__0_i_1_n_0;
  wire Zero2_carry__0_i_2_n_0;
  wire Zero2_carry__0_i_3_n_0;
  wire Zero2_carry__0_i_4_n_0;
  wire Zero2_carry__0_n_0;
  wire Zero2_carry__0_n_1;
  wire Zero2_carry__0_n_2;
  wire Zero2_carry__0_n_3;
  wire Zero2_carry__0_n_4;
  wire Zero2_carry__0_n_5;
  wire Zero2_carry__0_n_6;
  wire Zero2_carry__0_n_7;
  wire Zero2_carry__1_i_1_n_0;
  wire Zero2_carry__1_i_2_n_0;
  wire Zero2_carry__1_i_3_n_0;
  wire Zero2_carry__1_i_4_n_0;
  wire Zero2_carry__1_n_0;
  wire Zero2_carry__1_n_1;
  wire Zero2_carry__1_n_2;
  wire Zero2_carry__1_n_3;
  wire Zero2_carry__1_n_4;
  wire Zero2_carry__1_n_5;
  wire Zero2_carry__1_n_6;
  wire Zero2_carry__1_n_7;
  wire Zero2_carry__2_i_1_n_0;
  wire Zero2_carry__2_i_2_n_0;
  wire Zero2_carry__2_i_3_n_0;
  wire Zero2_carry__2_i_4_n_0;
  wire Zero2_carry__2_n_0;
  wire Zero2_carry__2_n_1;
  wire Zero2_carry__2_n_2;
  wire Zero2_carry__2_n_3;
  wire Zero2_carry__2_n_4;
  wire Zero2_carry__2_n_5;
  wire Zero2_carry__2_n_6;
  wire Zero2_carry__2_n_7;
  wire Zero2_carry__3_i_1_n_0;
  wire Zero2_carry__3_i_2_n_0;
  wire Zero2_carry__3_i_3_n_0;
  wire Zero2_carry__3_i_4_n_0;
  wire Zero2_carry__3_n_0;
  wire Zero2_carry__3_n_1;
  wire Zero2_carry__3_n_2;
  wire Zero2_carry__3_n_3;
  wire Zero2_carry__3_n_4;
  wire Zero2_carry__3_n_5;
  wire Zero2_carry__3_n_6;
  wire Zero2_carry__3_n_7;
  wire Zero2_carry__4_i_1_n_0;
  wire Zero2_carry__4_i_2_n_0;
  wire Zero2_carry__4_i_3_n_0;
  wire Zero2_carry__4_i_4_n_0;
  wire Zero2_carry__4_n_0;
  wire Zero2_carry__4_n_1;
  wire Zero2_carry__4_n_2;
  wire Zero2_carry__4_n_3;
  wire Zero2_carry__4_n_4;
  wire Zero2_carry__4_n_5;
  wire Zero2_carry__4_n_6;
  wire Zero2_carry__4_n_7;
  wire Zero2_carry__5_i_1_n_0;
  wire Zero2_carry__5_i_2_n_0;
  wire Zero2_carry__5_i_3_n_0;
  wire Zero2_carry__5_i_4_n_0;
  wire Zero2_carry__5_n_0;
  wire Zero2_carry__5_n_1;
  wire Zero2_carry__5_n_2;
  wire Zero2_carry__5_n_3;
  wire Zero2_carry__5_n_4;
  wire Zero2_carry__5_n_5;
  wire Zero2_carry__5_n_6;
  wire Zero2_carry__5_n_7;
  wire Zero2_carry__6_i_1_n_0;
  wire Zero2_carry__6_i_2_n_0;
  wire Zero2_carry__6_i_3_n_0;
  wire Zero2_carry__6_i_4_n_0;
  wire Zero2_carry__6_n_1;
  wire Zero2_carry__6_n_2;
  wire Zero2_carry__6_n_3;
  wire Zero2_carry__6_n_5;
  wire Zero2_carry__6_n_6;
  wire Zero2_carry__6_n_7;
  wire Zero2_carry_i_1_n_0;
  wire Zero2_carry_i_2_n_0;
  wire Zero2_carry_i_3_n_0;
  wire Zero2_carry_i_4_n_0;
  wire Zero2_carry_n_0;
  wire Zero2_carry_n_1;
  wire Zero2_carry_n_2;
  wire Zero2_carry_n_3;
  wire Zero2_carry_n_4;
  wire Zero2_carry_n_5;
  wire Zero2_carry_n_6;
  wire Zero2_carry_n_7;
  wire Zero4__15;
  wire Zero4_carry__0_i_1_n_0;
  wire Zero4_carry__0_i_2_n_0;
  wire Zero4_carry__0_i_3_n_0;
  wire Zero4_carry__0_i_4_n_0;
  wire Zero4_carry__0_i_5_n_0;
  wire Zero4_carry__0_i_6_n_0;
  wire Zero4_carry__0_i_7_n_0;
  wire Zero4_carry__0_i_8_n_0;
  wire Zero4_carry__0_n_0;
  wire Zero4_carry__0_n_1;
  wire Zero4_carry__0_n_2;
  wire Zero4_carry__0_n_3;
  wire Zero4_carry__1_i_1_n_0;
  wire Zero4_carry__1_i_2_n_0;
  wire Zero4_carry__1_i_3_n_0;
  wire Zero4_carry__1_i_4_n_0;
  wire Zero4_carry__1_i_5_n_0;
  wire Zero4_carry__1_i_6_n_0;
  wire Zero4_carry__1_i_7_n_0;
  wire Zero4_carry__1_i_8_n_0;
  wire Zero4_carry__1_n_0;
  wire Zero4_carry__1_n_1;
  wire Zero4_carry__1_n_2;
  wire Zero4_carry__1_n_3;
  wire Zero4_carry__2_i_1_n_0;
  wire Zero4_carry__2_i_2_n_0;
  wire Zero4_carry__2_i_3_n_0;
  wire Zero4_carry__2_i_4_n_0;
  wire Zero4_carry__2_i_5_n_0;
  wire Zero4_carry__2_i_6_n_0;
  wire Zero4_carry__2_i_7_n_0;
  wire Zero4_carry__2_i_8_n_0;
  wire Zero4_carry__2_n_1;
  wire Zero4_carry__2_n_2;
  wire Zero4_carry__2_n_3;
  wire Zero4_carry_i_1_n_0;
  wire Zero4_carry_i_2_n_0;
  wire Zero4_carry_i_3_n_0;
  wire Zero4_carry_i_4_n_0;
  wire Zero4_carry_i_5_n_0;
  wire Zero4_carry_i_6_n_0;
  wire Zero4_carry_i_7_n_0;
  wire Zero4_carry_i_8_n_0;
  wire Zero4_carry_n_0;
  wire Zero4_carry_n_1;
  wire Zero4_carry_n_2;
  wire Zero4_carry_n_3;
  wire Zero_INST_0_i_19_n_0;
  wire Zero_INST_0_i_1_n_0;
  wire Zero_INST_0_i_20_n_0;
  wire Zero_INST_0_i_21_n_0;
  wire Zero_INST_0_i_2_n_0;
  wire Zero_INST_0_i_4_n_0;
  wire Zero_INST_0_i_73_n_0;
  wire Zero_INST_0_i_74_n_0;
  wire Zero_INST_0_i_75_n_0;
  wire Zero_INST_0_i_76_n_0;
  wire Zero_INST_0_i_77_n_0;
  wire Zero_INST_0_i_78_n_0;
  wire Zero_INST_0_i_9_n_0;
  wire data1;
  wire data2;
  wire p_4_in;
  wire [3:3]NLW_Zero2_carry__6_CO_UNCONNECTED;
  wire [3:0]NLW_Zero4_carry_O_UNCONNECTED;
  wire [3:0]NLW_Zero4_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_Zero4_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_Zero4_carry__2_O_UNCONNECTED;

  assign A_0__s_net_1 = A_0__s_port_;
  assign A_10__s_net_1 = A_10__s_port_;
  assign A_14__s_net_1 = A_14__s_port_;
  assign A_16__s_net_1 = A_16__s_port_;
  assign A_18__s_net_1 = A_18__s_port_;
  assign A_24__s_net_1 = A_24__s_port_;
  assign A_26__s_net_1 = A_26__s_port_;
  assign A_2__s_net_1 = A_2__s_port_;
  assign A_4__s_net_1 = A_4__s_port_;
  assign A_8__s_net_1 = A_8__s_port_;
  assign B_12__s_net_1 = B_12__s_port_;
  assign B_13__s_net_1 = B_13__s_port_;
  assign B_14__s_net_1 = B_14__s_port_;
  assign B_15__s_net_1 = B_15__s_port_;
  assign B_22__s_net_1 = B_22__s_port_;
  assign B_23__s_net_1 = B_23__s_port_;
  assign B_4__s_net_1 = B_4__s_port_;
  assign B_5__s_net_1 = B_5__s_port_;
  assign B_6__s_net_1 = B_6__s_port_;
  assign B_7__s_net_1 = B_7__s_port_;
  MUXF7 \Result[0]_INST_0 
       (.I0(\Result[0]_INST_0_i_1_n_0 ),
        .I1(\Result[0]_INST_0_i_2_n_0 ),
        .O(Result[0]),
        .S(AluOp[2]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[0]_INST_0_i_1 
       (.I0(A_14__s_net_1),
        .I1(AluOp[1]),
        .I2(Zero2_carry_n_7),
        .I3(AluOp[0]),
        .I4(\B[0] [0]),
        .O(\Result[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h30BBFC88FC883088)) 
    \Result[0]_INST_0_i_2 
       (.I0(Zero_INST_0_i_9_n_0),
        .I1(AluOp[1]),
        .I2(Zero4__15),
        .I3(AluOp[0]),
        .I4(A[0]),
        .I5(B[0]),
        .O(\Result[0]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[10]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[10]),
        .I2(A[10]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[10]_INST_0_i_1_n_0 ),
        .O(Result[10]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[10]_INST_0_i_1 
       (.I0(\A[14]_9 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__1_n_5),
        .I3(AluOp[0]),
        .I4(\B[0]_1 [2]),
        .O(\Result[10]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[11]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[11]),
        .I2(A[11]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[11]_INST_0_i_1_n_0 ),
        .O(Result[11]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[11]_INST_0_i_1 
       (.I0(\A[14]_10 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__1_n_4),
        .I3(AluOp[0]),
        .I4(\B[0]_1 [3]),
        .O(\Result[11]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[12]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[12]),
        .I2(A[12]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[12]_INST_0_i_1_n_0 ),
        .O(Result[12]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[12]_INST_0_i_1 
       (.I0(B_12__s_net_1),
        .I1(\A[14]_11 ),
        .I2(AluOp[1]),
        .I3(Zero2_carry__2_n_7),
        .I4(AluOp[0]),
        .I5(\B[0]_2 [0]),
        .O(\Result[12]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[13]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[13]),
        .I2(A[13]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[13]_INST_0_i_1_n_0 ),
        .O(Result[13]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[13]_INST_0_i_1 
       (.I0(B_13__s_net_1),
        .I1(\A[14]_12 ),
        .I2(AluOp[1]),
        .I3(Zero2_carry__2_n_6),
        .I4(AluOp[0]),
        .I5(\B[0]_2 [1]),
        .O(\Result[13]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[14]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[14]),
        .I2(A[14]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[14]_INST_0_i_1_n_0 ),
        .O(Result[14]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[14]_INST_0_i_1 
       (.I0(B_14__s_net_1),
        .I1(\A[14]_13 ),
        .I2(AluOp[1]),
        .I3(Zero2_carry__2_n_5),
        .I4(AluOp[0]),
        .I5(\B[0]_2 [2]),
        .O(\Result[14]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[15]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[15]),
        .I2(A[15]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[15]_INST_0_i_1_n_0 ),
        .O(Result[15]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[15]_INST_0_i_1 
       (.I0(B_15__s_net_1),
        .I1(\A[14]_14 ),
        .I2(AluOp[1]),
        .I3(Zero2_carry__2_n_4),
        .I4(AluOp[0]),
        .I5(\B[0]_2 [3]),
        .O(\Result[15]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[16]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[16]),
        .I2(A[16]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[16]_INST_0_i_1_n_0 ),
        .O(Result[16]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[16]_INST_0_i_1 
       (.I0(\A[14]_15 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__3_n_7),
        .I3(AluOp[0]),
        .I4(\B[0]_3 [0]),
        .O(\Result[16]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[17]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[17]),
        .I2(A[17]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[17]_INST_0_i_1_n_0 ),
        .O(Result[17]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[17]_INST_0_i_1 
       (.I0(\A[14]_16 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__3_n_6),
        .I3(AluOp[0]),
        .I4(\B[0]_3 [1]),
        .O(\Result[17]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[18]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[18]),
        .I2(A[18]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[18]_INST_0_i_1_n_0 ),
        .O(Result[18]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[18]_INST_0_i_1 
       (.I0(\A[14]_17 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__3_n_5),
        .I3(AluOp[0]),
        .I4(\B[0]_3 [2]),
        .O(\Result[18]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[19]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[19]),
        .I2(A[19]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[19]_INST_0_i_1_n_0 ),
        .O(Result[19]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[19]_INST_0_i_1 
       (.I0(\A[14]_18 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__3_n_4),
        .I3(AluOp[0]),
        .I4(\B[0]_3 [3]),
        .O(\Result[19]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[1]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[1]),
        .I2(A[1]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[1]_INST_0_i_1_n_0 ),
        .O(Result[1]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[1]_INST_0_i_1 
       (.I0(\A[14]_0 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry_n_6),
        .I3(AluOp[0]),
        .I4(\B[0] [1]),
        .O(\Result[1]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[20]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[20]),
        .I2(A[20]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[20]_INST_0_i_1_n_0 ),
        .O(Result[20]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[20]_INST_0_i_1 
       (.I0(\A[14]_19 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__4_n_7),
        .I3(AluOp[0]),
        .I4(\B[0]_4 [0]),
        .O(\Result[20]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[21]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[21]),
        .I2(A[21]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[21]_INST_0_i_1_n_0 ),
        .O(Result[21]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[21]_INST_0_i_1 
       (.I0(\A[14]_20 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__4_n_6),
        .I3(AluOp[0]),
        .I4(\B[0]_4 [1]),
        .O(\Result[21]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[22]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[22]),
        .I2(A[22]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[22]_INST_0_i_1_n_0 ),
        .O(Result[22]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[22]_INST_0_i_1 
       (.I0(B_22__s_net_1),
        .I1(\A[14]_21 ),
        .I2(AluOp[1]),
        .I3(Zero2_carry__4_n_5),
        .I4(AluOp[0]),
        .I5(\B[0]_4 [2]),
        .O(\Result[22]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[23]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[23]),
        .I2(A[23]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[23]_INST_0_i_1_n_0 ),
        .O(Result[23]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[23]_INST_0_i_1 
       (.I0(B_23__s_net_1),
        .I1(\A[14]_22 ),
        .I2(AluOp[1]),
        .I3(Zero2_carry__4_n_4),
        .I4(AluOp[0]),
        .I5(\B[0]_4 [3]),
        .O(\Result[23]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[24]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[24]),
        .I2(A[24]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[24]_INST_0_i_1_n_0 ),
        .O(Result[24]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[24]_INST_0_i_1 
       (.I0(\A[14]_23 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__5_n_7),
        .I3(AluOp[0]),
        .I4(\B[0]_5 [0]),
        .O(\Result[24]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[25]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[25]),
        .I2(A[25]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[25]_INST_0_i_1_n_0 ),
        .O(Result[25]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[25]_INST_0_i_1 
       (.I0(\A[14]_24 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__5_n_6),
        .I3(AluOp[0]),
        .I4(\B[0]_5 [1]),
        .O(\Result[25]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[26]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[26]),
        .I2(A[26]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[26]_INST_0_i_1_n_0 ),
        .O(Result[26]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[26]_INST_0_i_1 
       (.I0(\A[14]_25 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__5_n_5),
        .I3(AluOp[0]),
        .I4(\B[0]_5 [2]),
        .O(\Result[26]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[27]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[27]),
        .I2(A[27]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[27]_INST_0_i_1_n_0 ),
        .O(Result[27]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[27]_INST_0_i_1 
       (.I0(\A[14]_26 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__5_n_4),
        .I3(AluOp[0]),
        .I4(\B[0]_5 [3]),
        .O(\Result[27]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[28]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[28]),
        .I2(A[28]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[28]_INST_0_i_1_n_0 ),
        .O(Result[28]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[28]_INST_0_i_1 
       (.I0(\A[14]_27 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__6_n_7),
        .I3(AluOp[0]),
        .I4(O[0]),
        .O(\Result[28]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[29]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[29]),
        .I2(A[29]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[29]_INST_0_i_1_n_0 ),
        .O(Result[29]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[29]_INST_0_i_1 
       (.I0(\A[14]_28 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__6_n_6),
        .I3(AluOp[0]),
        .I4(O[1]),
        .O(\Result[29]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[2]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[2]),
        .I2(A[2]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[2]_INST_0_i_1_n_0 ),
        .O(Result[2]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[2]_INST_0_i_1 
       (.I0(\A[14]_1 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry_n_5),
        .I3(AluOp[0]),
        .I4(\B[0] [2]),
        .O(\Result[2]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[30]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[30]),
        .I2(A[30]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[30]_INST_0_i_1_n_0 ),
        .O(Result[30]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[30]_INST_0_i_1 
       (.I0(\A[14]_29 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__6_n_5),
        .I3(AluOp[0]),
        .I4(O[2]),
        .O(\Result[30]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[31]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[31]),
        .I2(A[31]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[31]_INST_0_i_1_n_0 ),
        .O(Result[31]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[31]_INST_0_i_1 
       (.I0(p_4_in),
        .I1(data2),
        .I2(AluOp[1]),
        .I3(data1),
        .I4(AluOp[0]),
        .I5(O[3]),
        .O(\Result[31]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[3]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[3]),
        .I2(A[3]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[3]_INST_0_i_1_n_0 ),
        .O(Result[3]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[3]_INST_0_i_1 
       (.I0(\A[14]_2 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry_n_4),
        .I3(AluOp[0]),
        .I4(\B[0] [3]),
        .O(\Result[3]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[4]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[4]),
        .I2(A[4]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[4]_INST_0_i_1_n_0 ),
        .O(Result[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[4]_INST_0_i_1 
       (.I0(B_4__s_net_1),
        .I1(\A[14]_3 ),
        .I2(AluOp[1]),
        .I3(Zero2_carry__0_n_7),
        .I4(AluOp[0]),
        .I5(\B[0]_0 [0]),
        .O(\Result[4]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[5]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[5]),
        .I2(A[5]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[5]_INST_0_i_1_n_0 ),
        .O(Result[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[5]_INST_0_i_1 
       (.I0(B_5__s_net_1),
        .I1(\A[14]_4 ),
        .I2(AluOp[1]),
        .I3(Zero2_carry__0_n_6),
        .I4(AluOp[0]),
        .I5(\B[0]_0 [1]),
        .O(\Result[5]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[6]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[6]),
        .I2(A[6]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[6]_INST_0_i_1_n_0 ),
        .O(Result[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[6]_INST_0_i_1 
       (.I0(B_6__s_net_1),
        .I1(\A[14]_5 ),
        .I2(AluOp[1]),
        .I3(Zero2_carry__0_n_5),
        .I4(AluOp[0]),
        .I5(\B[0]_0 [2]),
        .O(\Result[6]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[7]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[7]),
        .I2(A[7]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[7]_INST_0_i_1_n_0 ),
        .O(Result[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[7]_INST_0_i_1 
       (.I0(B_7__s_net_1),
        .I1(\A[14]_6 ),
        .I2(AluOp[1]),
        .I3(Zero2_carry__0_n_4),
        .I4(AluOp[0]),
        .I5(\B[0]_0 [3]),
        .O(\Result[7]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[8]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[8]),
        .I2(A[8]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[8]_INST_0_i_1_n_0 ),
        .O(Result[8]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[8]_INST_0_i_1 
       (.I0(\A[14]_7 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__1_n_7),
        .I3(AluOp[0]),
        .I4(\B[0]_1 [0]),
        .O(\Result[8]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2840FFFF28400000)) 
    \Result[9]_INST_0 
       (.I0(AluOp[1]),
        .I1(B[9]),
        .I2(A[9]),
        .I3(AluOp[0]),
        .I4(AluOp[2]),
        .I5(\Result[9]_INST_0_i_1_n_0 ),
        .O(Result[9]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[9]_INST_0_i_1 
       (.I0(\A[14]_8 ),
        .I1(AluOp[1]),
        .I2(Zero2_carry__1_n_6),
        .I3(AluOp[0]),
        .I4(\B[0]_1 [1]),
        .O(\Result[9]_INST_0_i_1_n_0 ));
  CARRY4 Zero2_carry
       (.CI(1'b0),
        .CO({Zero2_carry_n_0,Zero2_carry_n_1,Zero2_carry_n_2,Zero2_carry_n_3}),
        .CYINIT(1'b1),
        .DI(A[3:0]),
        .O({Zero2_carry_n_4,Zero2_carry_n_5,Zero2_carry_n_6,Zero2_carry_n_7}),
        .S({Zero2_carry_i_1_n_0,Zero2_carry_i_2_n_0,Zero2_carry_i_3_n_0,Zero2_carry_i_4_n_0}));
  CARRY4 Zero2_carry__0
       (.CI(Zero2_carry_n_0),
        .CO({Zero2_carry__0_n_0,Zero2_carry__0_n_1,Zero2_carry__0_n_2,Zero2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(A[7:4]),
        .O({Zero2_carry__0_n_4,Zero2_carry__0_n_5,Zero2_carry__0_n_6,Zero2_carry__0_n_7}),
        .S({Zero2_carry__0_i_1_n_0,Zero2_carry__0_i_2_n_0,Zero2_carry__0_i_3_n_0,Zero2_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__0_i_1
       (.I0(B[7]),
        .I1(A[7]),
        .O(Zero2_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__0_i_2
       (.I0(B[6]),
        .I1(A[6]),
        .O(Zero2_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__0_i_3
       (.I0(B[5]),
        .I1(A[5]),
        .O(Zero2_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__0_i_4
       (.I0(B[4]),
        .I1(A[4]),
        .O(Zero2_carry__0_i_4_n_0));
  CARRY4 Zero2_carry__1
       (.CI(Zero2_carry__0_n_0),
        .CO({Zero2_carry__1_n_0,Zero2_carry__1_n_1,Zero2_carry__1_n_2,Zero2_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(A[11:8]),
        .O({Zero2_carry__1_n_4,Zero2_carry__1_n_5,Zero2_carry__1_n_6,Zero2_carry__1_n_7}),
        .S({Zero2_carry__1_i_1_n_0,Zero2_carry__1_i_2_n_0,Zero2_carry__1_i_3_n_0,Zero2_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__1_i_1
       (.I0(B[11]),
        .I1(A[11]),
        .O(Zero2_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__1_i_2
       (.I0(B[10]),
        .I1(A[10]),
        .O(Zero2_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__1_i_3
       (.I0(B[9]),
        .I1(A[9]),
        .O(Zero2_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__1_i_4
       (.I0(B[8]),
        .I1(A[8]),
        .O(Zero2_carry__1_i_4_n_0));
  CARRY4 Zero2_carry__2
       (.CI(Zero2_carry__1_n_0),
        .CO({Zero2_carry__2_n_0,Zero2_carry__2_n_1,Zero2_carry__2_n_2,Zero2_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(A[15:12]),
        .O({Zero2_carry__2_n_4,Zero2_carry__2_n_5,Zero2_carry__2_n_6,Zero2_carry__2_n_7}),
        .S({Zero2_carry__2_i_1_n_0,Zero2_carry__2_i_2_n_0,Zero2_carry__2_i_3_n_0,Zero2_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__2_i_1
       (.I0(B[15]),
        .I1(A[15]),
        .O(Zero2_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__2_i_2
       (.I0(B[14]),
        .I1(A[14]),
        .O(Zero2_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__2_i_3
       (.I0(B[13]),
        .I1(A[13]),
        .O(Zero2_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__2_i_4
       (.I0(B[12]),
        .I1(A[12]),
        .O(Zero2_carry__2_i_4_n_0));
  CARRY4 Zero2_carry__3
       (.CI(Zero2_carry__2_n_0),
        .CO({Zero2_carry__3_n_0,Zero2_carry__3_n_1,Zero2_carry__3_n_2,Zero2_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(A[19:16]),
        .O({Zero2_carry__3_n_4,Zero2_carry__3_n_5,Zero2_carry__3_n_6,Zero2_carry__3_n_7}),
        .S({Zero2_carry__3_i_1_n_0,Zero2_carry__3_i_2_n_0,Zero2_carry__3_i_3_n_0,Zero2_carry__3_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__3_i_1
       (.I0(B[19]),
        .I1(A[19]),
        .O(Zero2_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__3_i_2
       (.I0(B[18]),
        .I1(A[18]),
        .O(Zero2_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__3_i_3
       (.I0(B[17]),
        .I1(A[17]),
        .O(Zero2_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__3_i_4
       (.I0(B[16]),
        .I1(A[16]),
        .O(Zero2_carry__3_i_4_n_0));
  CARRY4 Zero2_carry__4
       (.CI(Zero2_carry__3_n_0),
        .CO({Zero2_carry__4_n_0,Zero2_carry__4_n_1,Zero2_carry__4_n_2,Zero2_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(A[23:20]),
        .O({Zero2_carry__4_n_4,Zero2_carry__4_n_5,Zero2_carry__4_n_6,Zero2_carry__4_n_7}),
        .S({Zero2_carry__4_i_1_n_0,Zero2_carry__4_i_2_n_0,Zero2_carry__4_i_3_n_0,Zero2_carry__4_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__4_i_1
       (.I0(B[23]),
        .I1(A[23]),
        .O(Zero2_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__4_i_2
       (.I0(B[22]),
        .I1(A[22]),
        .O(Zero2_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__4_i_3
       (.I0(B[21]),
        .I1(A[21]),
        .O(Zero2_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__4_i_4
       (.I0(B[20]),
        .I1(A[20]),
        .O(Zero2_carry__4_i_4_n_0));
  CARRY4 Zero2_carry__5
       (.CI(Zero2_carry__4_n_0),
        .CO({Zero2_carry__5_n_0,Zero2_carry__5_n_1,Zero2_carry__5_n_2,Zero2_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(A[27:24]),
        .O({Zero2_carry__5_n_4,Zero2_carry__5_n_5,Zero2_carry__5_n_6,Zero2_carry__5_n_7}),
        .S({Zero2_carry__5_i_1_n_0,Zero2_carry__5_i_2_n_0,Zero2_carry__5_i_3_n_0,Zero2_carry__5_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__5_i_1
       (.I0(B[27]),
        .I1(A[27]),
        .O(Zero2_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__5_i_2
       (.I0(B[26]),
        .I1(A[26]),
        .O(Zero2_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__5_i_3
       (.I0(B[25]),
        .I1(A[25]),
        .O(Zero2_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__5_i_4
       (.I0(B[24]),
        .I1(A[24]),
        .O(Zero2_carry__5_i_4_n_0));
  CARRY4 Zero2_carry__6
       (.CI(Zero2_carry__5_n_0),
        .CO({NLW_Zero2_carry__6_CO_UNCONNECTED[3],Zero2_carry__6_n_1,Zero2_carry__6_n_2,Zero2_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,A[30:28]}),
        .O({data1,Zero2_carry__6_n_5,Zero2_carry__6_n_6,Zero2_carry__6_n_7}),
        .S({Zero2_carry__6_i_1_n_0,Zero2_carry__6_i_2_n_0,Zero2_carry__6_i_3_n_0,Zero2_carry__6_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__6_i_1
       (.I0(B[31]),
        .I1(A[31]),
        .O(Zero2_carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__6_i_2
       (.I0(B[30]),
        .I1(A[30]),
        .O(Zero2_carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__6_i_3
       (.I0(B[29]),
        .I1(A[29]),
        .O(Zero2_carry__6_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry__6_i_4
       (.I0(B[28]),
        .I1(A[28]),
        .O(Zero2_carry__6_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry_i_1
       (.I0(B[3]),
        .I1(A[3]),
        .O(Zero2_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry_i_2
       (.I0(B[2]),
        .I1(A[2]),
        .O(Zero2_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry_i_3
       (.I0(B[1]),
        .I1(A[1]),
        .O(Zero2_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    Zero2_carry_i_4
       (.I0(B[0]),
        .I1(A[0]),
        .O(Zero2_carry_i_4_n_0));
  CARRY4 Zero4_carry
       (.CI(1'b0),
        .CO({Zero4_carry_n_0,Zero4_carry_n_1,Zero4_carry_n_2,Zero4_carry_n_3}),
        .CYINIT(1'b0),
        .DI({Zero4_carry_i_1_n_0,Zero4_carry_i_2_n_0,Zero4_carry_i_3_n_0,Zero4_carry_i_4_n_0}),
        .O(NLW_Zero4_carry_O_UNCONNECTED[3:0]),
        .S({Zero4_carry_i_5_n_0,Zero4_carry_i_6_n_0,Zero4_carry_i_7_n_0,Zero4_carry_i_8_n_0}));
  CARRY4 Zero4_carry__0
       (.CI(Zero4_carry_n_0),
        .CO({Zero4_carry__0_n_0,Zero4_carry__0_n_1,Zero4_carry__0_n_2,Zero4_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({Zero4_carry__0_i_1_n_0,Zero4_carry__0_i_2_n_0,Zero4_carry__0_i_3_n_0,Zero4_carry__0_i_4_n_0}),
        .O(NLW_Zero4_carry__0_O_UNCONNECTED[3:0]),
        .S({Zero4_carry__0_i_5_n_0,Zero4_carry__0_i_6_n_0,Zero4_carry__0_i_7_n_0,Zero4_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry__0_i_1
       (.I0(B[14]),
        .I1(A[14]),
        .I2(A[15]),
        .I3(B[15]),
        .O(Zero4_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry__0_i_2
       (.I0(B[12]),
        .I1(A[12]),
        .I2(A[13]),
        .I3(B[13]),
        .O(Zero4_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry__0_i_3
       (.I0(B[10]),
        .I1(A[10]),
        .I2(A[11]),
        .I3(B[11]),
        .O(Zero4_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry__0_i_4
       (.I0(B[8]),
        .I1(A[8]),
        .I2(A[9]),
        .I3(B[9]),
        .O(Zero4_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry__0_i_5
       (.I0(A[14]),
        .I1(B[14]),
        .I2(A[15]),
        .I3(B[15]),
        .O(Zero4_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry__0_i_6
       (.I0(A[12]),
        .I1(B[12]),
        .I2(A[13]),
        .I3(B[13]),
        .O(Zero4_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry__0_i_7
       (.I0(A[10]),
        .I1(B[10]),
        .I2(A[11]),
        .I3(B[11]),
        .O(Zero4_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry__0_i_8
       (.I0(A[8]),
        .I1(B[8]),
        .I2(A[9]),
        .I3(B[9]),
        .O(Zero4_carry__0_i_8_n_0));
  CARRY4 Zero4_carry__1
       (.CI(Zero4_carry__0_n_0),
        .CO({Zero4_carry__1_n_0,Zero4_carry__1_n_1,Zero4_carry__1_n_2,Zero4_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({Zero4_carry__1_i_1_n_0,Zero4_carry__1_i_2_n_0,Zero4_carry__1_i_3_n_0,Zero4_carry__1_i_4_n_0}),
        .O(NLW_Zero4_carry__1_O_UNCONNECTED[3:0]),
        .S({Zero4_carry__1_i_5_n_0,Zero4_carry__1_i_6_n_0,Zero4_carry__1_i_7_n_0,Zero4_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry__1_i_1
       (.I0(B[22]),
        .I1(A[22]),
        .I2(A[23]),
        .I3(B[23]),
        .O(Zero4_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry__1_i_2
       (.I0(B[20]),
        .I1(A[20]),
        .I2(A[21]),
        .I3(B[21]),
        .O(Zero4_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry__1_i_3
       (.I0(B[18]),
        .I1(A[18]),
        .I2(A[19]),
        .I3(B[19]),
        .O(Zero4_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry__1_i_4
       (.I0(B[16]),
        .I1(A[16]),
        .I2(A[17]),
        .I3(B[17]),
        .O(Zero4_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry__1_i_5
       (.I0(A[22]),
        .I1(B[22]),
        .I2(A[23]),
        .I3(B[23]),
        .O(Zero4_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry__1_i_6
       (.I0(A[20]),
        .I1(B[20]),
        .I2(A[21]),
        .I3(B[21]),
        .O(Zero4_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry__1_i_7
       (.I0(A[18]),
        .I1(B[18]),
        .I2(A[19]),
        .I3(B[19]),
        .O(Zero4_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry__1_i_8
       (.I0(A[16]),
        .I1(B[16]),
        .I2(A[17]),
        .I3(B[17]),
        .O(Zero4_carry__1_i_8_n_0));
  CARRY4 Zero4_carry__2
       (.CI(Zero4_carry__1_n_0),
        .CO({Zero4__15,Zero4_carry__2_n_1,Zero4_carry__2_n_2,Zero4_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({Zero4_carry__2_i_1_n_0,Zero4_carry__2_i_2_n_0,Zero4_carry__2_i_3_n_0,Zero4_carry__2_i_4_n_0}),
        .O(NLW_Zero4_carry__2_O_UNCONNECTED[3:0]),
        .S({Zero4_carry__2_i_5_n_0,Zero4_carry__2_i_6_n_0,Zero4_carry__2_i_7_n_0,Zero4_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry__2_i_1
       (.I0(B[30]),
        .I1(A[30]),
        .I2(A[31]),
        .I3(B[31]),
        .O(Zero4_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry__2_i_2
       (.I0(B[28]),
        .I1(A[28]),
        .I2(A[29]),
        .I3(B[29]),
        .O(Zero4_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry__2_i_3
       (.I0(B[26]),
        .I1(A[26]),
        .I2(A[27]),
        .I3(B[27]),
        .O(Zero4_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry__2_i_4
       (.I0(B[24]),
        .I1(A[24]),
        .I2(A[25]),
        .I3(B[25]),
        .O(Zero4_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry__2_i_5
       (.I0(A[31]),
        .I1(B[31]),
        .I2(A[30]),
        .I3(B[30]),
        .O(Zero4_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry__2_i_6
       (.I0(A[28]),
        .I1(B[28]),
        .I2(A[29]),
        .I3(B[29]),
        .O(Zero4_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry__2_i_7
       (.I0(A[26]),
        .I1(B[26]),
        .I2(A[27]),
        .I3(B[27]),
        .O(Zero4_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry__2_i_8
       (.I0(A[24]),
        .I1(B[24]),
        .I2(A[25]),
        .I3(B[25]),
        .O(Zero4_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry_i_1
       (.I0(B[6]),
        .I1(A[6]),
        .I2(A[7]),
        .I3(B[7]),
        .O(Zero4_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry_i_2
       (.I0(B[4]),
        .I1(A[4]),
        .I2(A[5]),
        .I3(B[5]),
        .O(Zero4_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry_i_3
       (.I0(B[2]),
        .I1(A[2]),
        .I2(A[3]),
        .I3(B[3]),
        .O(Zero4_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    Zero4_carry_i_4
       (.I0(B[0]),
        .I1(A[0]),
        .I2(A[1]),
        .I3(B[1]),
        .O(Zero4_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry_i_5
       (.I0(A[6]),
        .I1(B[6]),
        .I2(A[7]),
        .I3(B[7]),
        .O(Zero4_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry_i_6
       (.I0(A[4]),
        .I1(B[4]),
        .I2(A[5]),
        .I3(B[5]),
        .O(Zero4_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry_i_7
       (.I0(A[2]),
        .I1(B[2]),
        .I2(A[3]),
        .I3(B[3]),
        .O(Zero4_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    Zero4_carry_i_8
       (.I0(A[0]),
        .I1(B[0]),
        .I2(A[1]),
        .I3(B[1]),
        .O(Zero4_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    Zero_INST_0
       (.I0(Zero_INST_0_i_1_n_0),
        .I1(Zero_INST_0_i_2_n_0),
        .I2(AluOp[2]),
        .I3(A_4__s_net_1),
        .I4(AluOp[1]),
        .I5(Zero_INST_0_i_4_n_0),
        .O(Zero));
  LUT6 #(
    .INIT(64'h000100000001FFFF)) 
    Zero_INST_0_i_1
       (.I0(A_18__s_net_1),
        .I1(A_26__s_net_1),
        .I2(A_2__s_net_1),
        .I3(A_10__s_net_1),
        .I4(AluOp[0]),
        .I5(Zero_INST_0_i_9_n_0),
        .O(Zero_INST_0_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    Zero_INST_0_i_19
       (.I0(Zero2_carry__4_n_6),
        .I1(Zero2_carry__4_n_7),
        .I2(Zero2_carry__4_n_4),
        .I3(Zero2_carry__4_n_5),
        .I4(Zero_INST_0_i_73_n_0),
        .O(Zero_INST_0_i_19_n_0));
  LUT6 #(
    .INIT(64'h4444444444444447)) 
    Zero_INST_0_i_2
       (.I0(Zero4__15),
        .I1(AluOp[0]),
        .I2(A_16__s_net_1),
        .I3(A_24__s_net_1),
        .I4(A_0__s_net_1),
        .I5(A_8__s_net_1),
        .O(Zero_INST_0_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    Zero_INST_0_i_20
       (.I0(Zero2_carry__6_n_6),
        .I1(Zero2_carry__6_n_7),
        .I2(Zero2_carry__6_n_5),
        .I3(data1),
        .I4(Zero_INST_0_i_74_n_0),
        .O(Zero_INST_0_i_20_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_21
       (.I0(Zero_INST_0_i_75_n_0),
        .I1(Zero_INST_0_i_76_n_0),
        .I2(Zero_INST_0_i_77_n_0),
        .I3(Zero_INST_0_i_78_n_0),
        .O(Zero_INST_0_i_21_n_0));
  LUT6 #(
    .INIT(64'h0100010001FF0100)) 
    Zero_INST_0_i_4
       (.I0(Zero_INST_0_i_19_n_0),
        .I1(Zero_INST_0_i_20_n_0),
        .I2(Zero_INST_0_i_21_n_0),
        .I3(AluOp[0]),
        .I4(\B[0]_6 ),
        .I5(\B[12]_0 ),
        .O(Zero_INST_0_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_73
       (.I0(Zero2_carry__3_n_5),
        .I1(Zero2_carry__3_n_4),
        .I2(Zero2_carry__3_n_7),
        .I3(Zero2_carry__3_n_6),
        .O(Zero_INST_0_i_73_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_74
       (.I0(Zero2_carry__5_n_5),
        .I1(Zero2_carry__5_n_4),
        .I2(Zero2_carry__5_n_7),
        .I3(Zero2_carry__5_n_6),
        .O(Zero_INST_0_i_74_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_75
       (.I0(Zero2_carry__1_n_5),
        .I1(Zero2_carry__1_n_4),
        .I2(Zero2_carry__1_n_7),
        .I3(Zero2_carry__1_n_6),
        .O(Zero_INST_0_i_75_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_76
       (.I0(Zero2_carry__2_n_5),
        .I1(Zero2_carry__2_n_4),
        .I2(Zero2_carry__2_n_7),
        .I3(Zero2_carry__2_n_6),
        .O(Zero_INST_0_i_76_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_77
       (.I0(Zero2_carry_n_5),
        .I1(Zero2_carry_n_4),
        .I2(Zero2_carry_n_7),
        .I3(Zero2_carry_n_6),
        .O(Zero_INST_0_i_77_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_78
       (.I0(Zero2_carry__0_n_5),
        .I1(Zero2_carry__0_n_4),
        .I2(Zero2_carry__0_n_7),
        .I3(Zero2_carry__0_n_6),
        .O(Zero_INST_0_i_78_n_0));
  LUT3 #(
    .INIT(8'hB2)) 
    Zero_INST_0_i_9
       (.I0(Zero4__15),
        .I1(B[31]),
        .I2(A[31]),
        .O(Zero_INST_0_i_9_n_0));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_ALU_0_0,ALU,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "ALU,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    AluOp,
    Zero,
    Sign,
    Result);
  input [31:0]A;
  input [31:0]B;
  input [2:0]AluOp;
  output Zero;
  output Sign;
  output [31:0]Result;

  wire [31:0]A;
  wire [2:0]AluOp;
  wire [31:0]B;
  wire [30:0]\^Result ;
  wire \Result[0]_INST_0_i_3_n_0 ;
  wire \Result[10]_INST_0_i_2_n_0 ;
  wire \Result[10]_INST_0_i_3_n_0 ;
  wire \Result[10]_INST_0_i_4_n_0 ;
  wire \Result[11]_INST_0_i_10_n_0 ;
  wire \Result[11]_INST_0_i_2_n_0 ;
  wire \Result[11]_INST_0_i_3_n_0 ;
  wire \Result[11]_INST_0_i_3_n_1 ;
  wire \Result[11]_INST_0_i_3_n_2 ;
  wire \Result[11]_INST_0_i_3_n_3 ;
  wire \Result[11]_INST_0_i_3_n_4 ;
  wire \Result[11]_INST_0_i_3_n_5 ;
  wire \Result[11]_INST_0_i_3_n_6 ;
  wire \Result[11]_INST_0_i_3_n_7 ;
  wire \Result[11]_INST_0_i_4_n_0 ;
  wire \Result[11]_INST_0_i_5_n_0 ;
  wire \Result[11]_INST_0_i_6_n_0 ;
  wire \Result[11]_INST_0_i_7_n_0 ;
  wire \Result[11]_INST_0_i_8_n_0 ;
  wire \Result[11]_INST_0_i_9_n_0 ;
  wire \Result[12]_INST_0_i_2_n_0 ;
  wire \Result[12]_INST_0_i_3_n_0 ;
  wire \Result[12]_INST_0_i_4_n_0 ;
  wire \Result[12]_INST_0_i_5_n_0 ;
  wire \Result[13]_INST_0_i_2_n_0 ;
  wire \Result[13]_INST_0_i_3_n_0 ;
  wire \Result[13]_INST_0_i_4_n_0 ;
  wire \Result[13]_INST_0_i_5_n_0 ;
  wire \Result[14]_INST_0_i_2_n_0 ;
  wire \Result[14]_INST_0_i_3_n_0 ;
  wire \Result[14]_INST_0_i_4_n_0 ;
  wire \Result[14]_INST_0_i_5_n_0 ;
  wire \Result[15]_INST_0_i_10_n_0 ;
  wire \Result[15]_INST_0_i_2_n_0 ;
  wire \Result[15]_INST_0_i_3_n_0 ;
  wire \Result[15]_INST_0_i_4_n_0 ;
  wire \Result[15]_INST_0_i_4_n_1 ;
  wire \Result[15]_INST_0_i_4_n_2 ;
  wire \Result[15]_INST_0_i_4_n_3 ;
  wire \Result[15]_INST_0_i_4_n_4 ;
  wire \Result[15]_INST_0_i_4_n_5 ;
  wire \Result[15]_INST_0_i_4_n_6 ;
  wire \Result[15]_INST_0_i_4_n_7 ;
  wire \Result[15]_INST_0_i_5_n_0 ;
  wire \Result[15]_INST_0_i_6_n_0 ;
  wire \Result[15]_INST_0_i_7_n_0 ;
  wire \Result[15]_INST_0_i_8_n_0 ;
  wire \Result[15]_INST_0_i_9_n_0 ;
  wire \Result[16]_INST_0_i_2_n_0 ;
  wire \Result[16]_INST_0_i_3_n_0 ;
  wire \Result[16]_INST_0_i_4_n_0 ;
  wire \Result[16]_INST_0_i_5_n_0 ;
  wire \Result[17]_INST_0_i_2_n_0 ;
  wire \Result[17]_INST_0_i_3_n_0 ;
  wire \Result[17]_INST_0_i_4_n_0 ;
  wire \Result[17]_INST_0_i_5_n_0 ;
  wire \Result[18]_INST_0_i_2_n_0 ;
  wire \Result[18]_INST_0_i_3_n_0 ;
  wire \Result[18]_INST_0_i_4_n_0 ;
  wire \Result[18]_INST_0_i_5_n_0 ;
  wire \Result[19]_INST_0_i_10_n_0 ;
  wire \Result[19]_INST_0_i_2_n_0 ;
  wire \Result[19]_INST_0_i_3_n_0 ;
  wire \Result[19]_INST_0_i_3_n_1 ;
  wire \Result[19]_INST_0_i_3_n_2 ;
  wire \Result[19]_INST_0_i_3_n_3 ;
  wire \Result[19]_INST_0_i_3_n_4 ;
  wire \Result[19]_INST_0_i_3_n_5 ;
  wire \Result[19]_INST_0_i_3_n_6 ;
  wire \Result[19]_INST_0_i_3_n_7 ;
  wire \Result[19]_INST_0_i_4_n_0 ;
  wire \Result[19]_INST_0_i_5_n_0 ;
  wire \Result[19]_INST_0_i_6_n_0 ;
  wire \Result[19]_INST_0_i_7_n_0 ;
  wire \Result[19]_INST_0_i_8_n_0 ;
  wire \Result[19]_INST_0_i_9_n_0 ;
  wire \Result[1]_INST_0_i_2_n_0 ;
  wire \Result[1]_INST_0_i_3_n_0 ;
  wire \Result[1]_INST_0_i_4_n_0 ;
  wire \Result[20]_INST_0_i_2_n_0 ;
  wire \Result[20]_INST_0_i_3_n_0 ;
  wire \Result[20]_INST_0_i_4_n_0 ;
  wire \Result[20]_INST_0_i_5_n_0 ;
  wire \Result[21]_INST_0_i_2_n_0 ;
  wire \Result[21]_INST_0_i_3_n_0 ;
  wire \Result[21]_INST_0_i_4_n_0 ;
  wire \Result[21]_INST_0_i_5_n_0 ;
  wire \Result[22]_INST_0_i_2_n_0 ;
  wire \Result[22]_INST_0_i_3_n_0 ;
  wire \Result[22]_INST_0_i_4_n_0 ;
  wire \Result[22]_INST_0_i_5_n_0 ;
  wire \Result[23]_INST_0_i_10_n_0 ;
  wire \Result[23]_INST_0_i_2_n_0 ;
  wire \Result[23]_INST_0_i_3_n_0 ;
  wire \Result[23]_INST_0_i_4_n_0 ;
  wire \Result[23]_INST_0_i_4_n_1 ;
  wire \Result[23]_INST_0_i_4_n_2 ;
  wire \Result[23]_INST_0_i_4_n_3 ;
  wire \Result[23]_INST_0_i_4_n_4 ;
  wire \Result[23]_INST_0_i_4_n_5 ;
  wire \Result[23]_INST_0_i_4_n_6 ;
  wire \Result[23]_INST_0_i_4_n_7 ;
  wire \Result[23]_INST_0_i_5_n_0 ;
  wire \Result[23]_INST_0_i_6_n_0 ;
  wire \Result[23]_INST_0_i_7_n_0 ;
  wire \Result[23]_INST_0_i_8_n_0 ;
  wire \Result[23]_INST_0_i_9_n_0 ;
  wire \Result[24]_INST_0_i_2_n_0 ;
  wire \Result[24]_INST_0_i_3_n_0 ;
  wire \Result[24]_INST_0_i_4_n_0 ;
  wire \Result[24]_INST_0_i_5_n_0 ;
  wire \Result[25]_INST_0_i_2_n_0 ;
  wire \Result[25]_INST_0_i_3_n_0 ;
  wire \Result[25]_INST_0_i_4_n_0 ;
  wire \Result[25]_INST_0_i_5_n_0 ;
  wire \Result[26]_INST_0_i_2_n_0 ;
  wire \Result[26]_INST_0_i_3_n_0 ;
  wire \Result[26]_INST_0_i_4_n_0 ;
  wire \Result[26]_INST_0_i_5_n_0 ;
  wire \Result[27]_INST_0_i_10_n_0 ;
  wire \Result[27]_INST_0_i_2_n_0 ;
  wire \Result[27]_INST_0_i_3_n_0 ;
  wire \Result[27]_INST_0_i_3_n_1 ;
  wire \Result[27]_INST_0_i_3_n_2 ;
  wire \Result[27]_INST_0_i_3_n_3 ;
  wire \Result[27]_INST_0_i_3_n_4 ;
  wire \Result[27]_INST_0_i_3_n_5 ;
  wire \Result[27]_INST_0_i_3_n_6 ;
  wire \Result[27]_INST_0_i_3_n_7 ;
  wire \Result[27]_INST_0_i_4_n_0 ;
  wire \Result[27]_INST_0_i_5_n_0 ;
  wire \Result[27]_INST_0_i_6_n_0 ;
  wire \Result[27]_INST_0_i_7_n_0 ;
  wire \Result[27]_INST_0_i_8_n_0 ;
  wire \Result[27]_INST_0_i_9_n_0 ;
  wire \Result[28]_INST_0_i_2_n_0 ;
  wire \Result[28]_INST_0_i_3_n_0 ;
  wire \Result[28]_INST_0_i_4_n_0 ;
  wire \Result[28]_INST_0_i_5_n_0 ;
  wire \Result[29]_INST_0_i_2_n_0 ;
  wire \Result[29]_INST_0_i_3_n_0 ;
  wire \Result[29]_INST_0_i_4_n_0 ;
  wire \Result[29]_INST_0_i_5_n_0 ;
  wire \Result[2]_INST_0_i_2_n_0 ;
  wire \Result[2]_INST_0_i_3_n_0 ;
  wire \Result[2]_INST_0_i_4_n_0 ;
  wire \Result[30]_INST_0_i_2_n_0 ;
  wire \Result[30]_INST_0_i_3_n_0 ;
  wire \Result[30]_INST_0_i_4_n_0 ;
  wire \Result[30]_INST_0_i_5_n_0 ;
  wire \Result[31]_INST_0_i_10_n_0 ;
  wire \Result[31]_INST_0_i_11_n_0 ;
  wire \Result[31]_INST_0_i_12_n_0 ;
  wire \Result[31]_INST_0_i_13_n_0 ;
  wire \Result[31]_INST_0_i_14_n_0 ;
  wire \Result[31]_INST_0_i_15_n_0 ;
  wire \Result[31]_INST_0_i_16_n_0 ;
  wire \Result[31]_INST_0_i_17_n_0 ;
  wire \Result[31]_INST_0_i_18_n_0 ;
  wire \Result[31]_INST_0_i_19_n_0 ;
  wire \Result[31]_INST_0_i_20_n_0 ;
  wire \Result[31]_INST_0_i_21_n_0 ;
  wire \Result[31]_INST_0_i_22_n_0 ;
  wire \Result[31]_INST_0_i_23_n_0 ;
  wire \Result[31]_INST_0_i_24_n_0 ;
  wire \Result[31]_INST_0_i_25_n_0 ;
  wire \Result[31]_INST_0_i_4_n_1 ;
  wire \Result[31]_INST_0_i_4_n_2 ;
  wire \Result[31]_INST_0_i_4_n_3 ;
  wire \Result[31]_INST_0_i_4_n_5 ;
  wire \Result[31]_INST_0_i_4_n_6 ;
  wire \Result[31]_INST_0_i_4_n_7 ;
  wire \Result[31]_INST_0_i_5_n_0 ;
  wire \Result[31]_INST_0_i_6_n_0 ;
  wire \Result[31]_INST_0_i_7_n_0 ;
  wire \Result[31]_INST_0_i_8_n_0 ;
  wire \Result[31]_INST_0_i_9_n_0 ;
  wire \Result[3]_INST_0_i_2_n_0 ;
  wire \Result[3]_INST_0_i_3_n_0 ;
  wire \Result[3]_INST_0_i_3_n_1 ;
  wire \Result[3]_INST_0_i_3_n_2 ;
  wire \Result[3]_INST_0_i_3_n_3 ;
  wire \Result[3]_INST_0_i_3_n_4 ;
  wire \Result[3]_INST_0_i_3_n_5 ;
  wire \Result[3]_INST_0_i_3_n_6 ;
  wire \Result[3]_INST_0_i_3_n_7 ;
  wire \Result[3]_INST_0_i_4_n_0 ;
  wire \Result[3]_INST_0_i_5_n_0 ;
  wire \Result[3]_INST_0_i_6_n_0 ;
  wire \Result[3]_INST_0_i_7_n_0 ;
  wire \Result[3]_INST_0_i_8_n_0 ;
  wire \Result[3]_INST_0_i_9_n_0 ;
  wire \Result[4]_INST_0_i_2_n_0 ;
  wire \Result[4]_INST_0_i_3_n_0 ;
  wire \Result[4]_INST_0_i_4_n_0 ;
  wire \Result[5]_INST_0_i_2_n_0 ;
  wire \Result[5]_INST_0_i_3_n_0 ;
  wire \Result[5]_INST_0_i_4_n_0 ;
  wire \Result[6]_INST_0_i_2_n_0 ;
  wire \Result[6]_INST_0_i_3_n_0 ;
  wire \Result[6]_INST_0_i_4_n_0 ;
  wire \Result[7]_INST_0_i_10_n_0 ;
  wire \Result[7]_INST_0_i_2_n_0 ;
  wire \Result[7]_INST_0_i_3_n_0 ;
  wire \Result[7]_INST_0_i_4_n_0 ;
  wire \Result[7]_INST_0_i_4_n_1 ;
  wire \Result[7]_INST_0_i_4_n_2 ;
  wire \Result[7]_INST_0_i_4_n_3 ;
  wire \Result[7]_INST_0_i_4_n_4 ;
  wire \Result[7]_INST_0_i_4_n_5 ;
  wire \Result[7]_INST_0_i_4_n_6 ;
  wire \Result[7]_INST_0_i_4_n_7 ;
  wire \Result[7]_INST_0_i_5_n_0 ;
  wire \Result[7]_INST_0_i_6_n_0 ;
  wire \Result[7]_INST_0_i_7_n_0 ;
  wire \Result[7]_INST_0_i_8_n_0 ;
  wire \Result[7]_INST_0_i_9_n_0 ;
  wire \Result[8]_INST_0_i_2_n_0 ;
  wire \Result[8]_INST_0_i_3_n_0 ;
  wire \Result[8]_INST_0_i_4_n_0 ;
  wire \Result[9]_INST_0_i_2_n_0 ;
  wire \Result[9]_INST_0_i_3_n_0 ;
  wire \Result[9]_INST_0_i_4_n_0 ;
  wire Sign;
  wire Zero;
  wire Zero_INST_0_i_100_n_0;
  wire Zero_INST_0_i_101_n_0;
  wire Zero_INST_0_i_102_n_0;
  wire Zero_INST_0_i_103_n_0;
  wire Zero_INST_0_i_104_n_0;
  wire Zero_INST_0_i_105_n_0;
  wire Zero_INST_0_i_106_n_0;
  wire Zero_INST_0_i_107_n_0;
  wire Zero_INST_0_i_108_n_0;
  wire Zero_INST_0_i_109_n_0;
  wire Zero_INST_0_i_10_n_0;
  wire Zero_INST_0_i_110_n_0;
  wire Zero_INST_0_i_111_n_0;
  wire Zero_INST_0_i_112_n_0;
  wire Zero_INST_0_i_113_n_0;
  wire Zero_INST_0_i_114_n_0;
  wire Zero_INST_0_i_115_n_0;
  wire Zero_INST_0_i_116_n_0;
  wire Zero_INST_0_i_11_n_0;
  wire Zero_INST_0_i_12_n_0;
  wire Zero_INST_0_i_13_n_0;
  wire Zero_INST_0_i_14_n_0;
  wire Zero_INST_0_i_15_n_0;
  wire Zero_INST_0_i_16_n_0;
  wire Zero_INST_0_i_17_n_0;
  wire Zero_INST_0_i_18_n_0;
  wire Zero_INST_0_i_22_n_0;
  wire Zero_INST_0_i_23_n_0;
  wire Zero_INST_0_i_24_n_0;
  wire Zero_INST_0_i_25_n_0;
  wire Zero_INST_0_i_26_n_0;
  wire Zero_INST_0_i_27_n_0;
  wire Zero_INST_0_i_28_n_0;
  wire Zero_INST_0_i_29_n_0;
  wire Zero_INST_0_i_30_n_0;
  wire Zero_INST_0_i_31_n_0;
  wire Zero_INST_0_i_32_n_0;
  wire Zero_INST_0_i_33_n_0;
  wire Zero_INST_0_i_34_n_0;
  wire Zero_INST_0_i_35_n_0;
  wire Zero_INST_0_i_36_n_0;
  wire Zero_INST_0_i_37_n_0;
  wire Zero_INST_0_i_38_n_0;
  wire Zero_INST_0_i_39_n_0;
  wire Zero_INST_0_i_3_n_0;
  wire Zero_INST_0_i_40_n_0;
  wire Zero_INST_0_i_41_n_0;
  wire Zero_INST_0_i_42_n_0;
  wire Zero_INST_0_i_43_n_0;
  wire Zero_INST_0_i_44_n_0;
  wire Zero_INST_0_i_45_n_0;
  wire Zero_INST_0_i_46_n_0;
  wire Zero_INST_0_i_47_n_0;
  wire Zero_INST_0_i_48_n_0;
  wire Zero_INST_0_i_49_n_0;
  wire Zero_INST_0_i_50_n_0;
  wire Zero_INST_0_i_51_n_0;
  wire Zero_INST_0_i_52_n_0;
  wire Zero_INST_0_i_53_n_0;
  wire Zero_INST_0_i_54_n_0;
  wire Zero_INST_0_i_55_n_0;
  wire Zero_INST_0_i_56_n_0;
  wire Zero_INST_0_i_57_n_0;
  wire Zero_INST_0_i_58_n_0;
  wire Zero_INST_0_i_59_n_0;
  wire Zero_INST_0_i_5_n_0;
  wire Zero_INST_0_i_60_n_0;
  wire Zero_INST_0_i_61_n_0;
  wire Zero_INST_0_i_62_n_0;
  wire Zero_INST_0_i_63_n_0;
  wire Zero_INST_0_i_64_n_0;
  wire Zero_INST_0_i_65_n_0;
  wire Zero_INST_0_i_66_n_0;
  wire Zero_INST_0_i_67_n_0;
  wire Zero_INST_0_i_68_n_0;
  wire Zero_INST_0_i_69_n_0;
  wire Zero_INST_0_i_6_n_0;
  wire Zero_INST_0_i_70_n_0;
  wire Zero_INST_0_i_71_n_0;
  wire Zero_INST_0_i_72_n_0;
  wire Zero_INST_0_i_79_n_0;
  wire Zero_INST_0_i_7_n_0;
  wire Zero_INST_0_i_80_n_0;
  wire Zero_INST_0_i_81_n_0;
  wire Zero_INST_0_i_82_n_0;
  wire Zero_INST_0_i_83_n_0;
  wire Zero_INST_0_i_84_n_0;
  wire Zero_INST_0_i_85_n_0;
  wire Zero_INST_0_i_86_n_0;
  wire Zero_INST_0_i_87_n_0;
  wire Zero_INST_0_i_88_n_0;
  wire Zero_INST_0_i_89_n_0;
  wire Zero_INST_0_i_8_n_0;
  wire Zero_INST_0_i_90_n_0;
  wire Zero_INST_0_i_91_n_0;
  wire Zero_INST_0_i_92_n_0;
  wire Zero_INST_0_i_93_n_0;
  wire Zero_INST_0_i_94_n_0;
  wire Zero_INST_0_i_95_n_0;
  wire Zero_INST_0_i_96_n_0;
  wire Zero_INST_0_i_97_n_0;
  wire Zero_INST_0_i_98_n_0;
  wire Zero_INST_0_i_99_n_0;
  wire data0;
  wire data2;
  wire p_4_in;
  wire [3:3]\NLW_Result[31]_INST_0_i_4_CO_UNCONNECTED ;

  assign Result[31] = Sign;
  assign Result[30:0] = \^Result [30:0];
  LUT5 #(
    .INIT(32'hCCB8CC88)) 
    \Result[0]_INST_0_i_3 
       (.I0(B[0]),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(A[0]),
        .I4(\Result[1]_INST_0_i_4_n_0 ),
        .O(\Result[0]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[10]_INST_0_i_2 
       (.I0(\Result[10]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[11]_INST_0_i_5_n_0 ),
        .I4(A[0]),
        .I5(\Result[10]_INST_0_i_4_n_0 ),
        .O(\Result[10]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[10]_INST_0_i_3 
       (.I0(A[10]),
        .I1(B[10]),
        .O(\Result[10]_INST_0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Result[10]_INST_0_i_4 
       (.I0(Zero_INST_0_i_102_n_0),
        .I1(A[1]),
        .I2(\Result[12]_INST_0_i_5_n_0 ),
        .O(\Result[10]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    \Result[11]_INST_0_i_10 
       (.I0(B[4]),
        .I1(A[2]),
        .I2(B[0]),
        .I3(A[3]),
        .I4(B[8]),
        .I5(A[4]),
        .O(\Result[11]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[11]_INST_0_i_2 
       (.I0(\Result[11]_INST_0_i_4_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[12]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[11]_INST_0_i_5_n_0 ),
        .O(\Result[11]_INST_0_i_2_n_0 ));
  CARRY4 \Result[11]_INST_0_i_3 
       (.CI(\Result[7]_INST_0_i_4_n_0 ),
        .CO({\Result[11]_INST_0_i_3_n_0 ,\Result[11]_INST_0_i_3_n_1 ,\Result[11]_INST_0_i_3_n_2 ,\Result[11]_INST_0_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI(A[11:8]),
        .O({\Result[11]_INST_0_i_3_n_4 ,\Result[11]_INST_0_i_3_n_5 ,\Result[11]_INST_0_i_3_n_6 ,\Result[11]_INST_0_i_3_n_7 }),
        .S({\Result[11]_INST_0_i_6_n_0 ,\Result[11]_INST_0_i_7_n_0 ,\Result[11]_INST_0_i_8_n_0 ,\Result[11]_INST_0_i_9_n_0 }));
  LUT2 #(
    .INIT(4'hE)) 
    \Result[11]_INST_0_i_4 
       (.I0(A[11]),
        .I1(B[11]),
        .O(\Result[11]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Result[11]_INST_0_i_5 
       (.I0(\Result[11]_INST_0_i_10_n_0 ),
        .I1(A[1]),
        .I2(\Result[13]_INST_0_i_5_n_0 ),
        .O(\Result[11]_INST_0_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[11]_INST_0_i_6 
       (.I0(A[11]),
        .I1(B[11]),
        .O(\Result[11]_INST_0_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[11]_INST_0_i_7 
       (.I0(A[10]),
        .I1(B[10]),
        .O(\Result[11]_INST_0_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[11]_INST_0_i_8 
       (.I0(A[9]),
        .I1(B[9]),
        .O(\Result[11]_INST_0_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[11]_INST_0_i_9 
       (.I0(A[8]),
        .I1(B[8]),
        .O(\Result[11]_INST_0_i_9_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \Result[12]_INST_0_i_2 
       (.I0(A[12]),
        .I1(B[12]),
        .O(\Result[12]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'hA808)) 
    \Result[12]_INST_0_i_3 
       (.I0(Zero_INST_0_i_55_n_0),
        .I1(\Result[13]_INST_0_i_4_n_0 ),
        .I2(A[0]),
        .I3(\Result[12]_INST_0_i_4_n_0 ),
        .O(\Result[12]_INST_0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Result[12]_INST_0_i_4 
       (.I0(\Result[12]_INST_0_i_5_n_0 ),
        .I1(A[1]),
        .I2(\Result[14]_INST_0_i_5_n_0 ),
        .O(\Result[12]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    \Result[12]_INST_0_i_5 
       (.I0(B[5]),
        .I1(A[2]),
        .I2(B[1]),
        .I3(A[3]),
        .I4(B[9]),
        .I5(A[4]),
        .O(\Result[12]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[13]_INST_0_i_2 
       (.I0(A[13]),
        .I1(B[13]),
        .O(\Result[13]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'hA808)) 
    \Result[13]_INST_0_i_3 
       (.I0(Zero_INST_0_i_55_n_0),
        .I1(\Result[14]_INST_0_i_4_n_0 ),
        .I2(A[0]),
        .I3(\Result[13]_INST_0_i_4_n_0 ),
        .O(\Result[13]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[13]_INST_0_i_4 
       (.I0(\Result[13]_INST_0_i_5_n_0 ),
        .I1(A[1]),
        .I2(\Result[15]_INST_0_i_10_n_0 ),
        .I3(A[2]),
        .I4(\Result[19]_INST_0_i_10_n_0 ),
        .O(\Result[13]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    \Result[13]_INST_0_i_5 
       (.I0(B[6]),
        .I1(A[2]),
        .I2(B[2]),
        .I3(A[3]),
        .I4(B[10]),
        .I5(A[4]),
        .O(\Result[13]_INST_0_i_5_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \Result[14]_INST_0_i_2 
       (.I0(A[14]),
        .I1(B[14]),
        .O(\Result[14]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'hA808)) 
    \Result[14]_INST_0_i_3 
       (.I0(Zero_INST_0_i_55_n_0),
        .I1(\Result[15]_INST_0_i_5_n_0 ),
        .I2(A[0]),
        .I3(\Result[14]_INST_0_i_4_n_0 ),
        .O(\Result[14]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Result[14]_INST_0_i_4 
       (.I0(\Result[14]_INST_0_i_5_n_0 ),
        .I1(A[1]),
        .I2(\Result[16]_INST_0_i_5_n_0 ),
        .I3(A[2]),
        .I4(\Result[20]_INST_0_i_5_n_0 ),
        .O(\Result[14]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    \Result[14]_INST_0_i_5 
       (.I0(B[7]),
        .I1(A[2]),
        .I2(B[3]),
        .I3(A[3]),
        .I4(B[11]),
        .I5(A[4]),
        .O(\Result[14]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \Result[15]_INST_0_i_10 
       (.I0(B[0]),
        .I1(A[3]),
        .I2(B[8]),
        .I3(A[4]),
        .O(\Result[15]_INST_0_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[15]_INST_0_i_2 
       (.I0(A[15]),
        .I1(B[15]),
        .O(\Result[15]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'hA808)) 
    \Result[15]_INST_0_i_3 
       (.I0(Zero_INST_0_i_55_n_0),
        .I1(\Result[16]_INST_0_i_4_n_0 ),
        .I2(A[0]),
        .I3(\Result[15]_INST_0_i_5_n_0 ),
        .O(\Result[15]_INST_0_i_3_n_0 ));
  CARRY4 \Result[15]_INST_0_i_4 
       (.CI(\Result[11]_INST_0_i_3_n_0 ),
        .CO({\Result[15]_INST_0_i_4_n_0 ,\Result[15]_INST_0_i_4_n_1 ,\Result[15]_INST_0_i_4_n_2 ,\Result[15]_INST_0_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI(A[15:12]),
        .O({\Result[15]_INST_0_i_4_n_4 ,\Result[15]_INST_0_i_4_n_5 ,\Result[15]_INST_0_i_4_n_6 ,\Result[15]_INST_0_i_4_n_7 }),
        .S({\Result[15]_INST_0_i_6_n_0 ,\Result[15]_INST_0_i_7_n_0 ,\Result[15]_INST_0_i_8_n_0 ,\Result[15]_INST_0_i_9_n_0 }));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[15]_INST_0_i_5 
       (.I0(\Result[15]_INST_0_i_10_n_0 ),
        .I1(\Result[19]_INST_0_i_10_n_0 ),
        .I2(A[1]),
        .I3(\Result[17]_INST_0_i_5_n_0 ),
        .I4(A[2]),
        .I5(\Result[21]_INST_0_i_5_n_0 ),
        .O(\Result[15]_INST_0_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[15]_INST_0_i_6 
       (.I0(A[15]),
        .I1(B[15]),
        .O(\Result[15]_INST_0_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[15]_INST_0_i_7 
       (.I0(A[14]),
        .I1(B[14]),
        .O(\Result[15]_INST_0_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[15]_INST_0_i_8 
       (.I0(A[13]),
        .I1(B[13]),
        .O(\Result[15]_INST_0_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[15]_INST_0_i_9 
       (.I0(A[12]),
        .I1(B[12]),
        .O(\Result[15]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[16]_INST_0_i_2 
       (.I0(\Result[16]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[17]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[16]_INST_0_i_4_n_0 ),
        .O(\Result[16]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \Result[16]_INST_0_i_3 
       (.I0(A[16]),
        .I1(B[16]),
        .O(\Result[16]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[16]_INST_0_i_4 
       (.I0(\Result[16]_INST_0_i_5_n_0 ),
        .I1(\Result[20]_INST_0_i_5_n_0 ),
        .I2(A[1]),
        .I3(\Result[18]_INST_0_i_5_n_0 ),
        .I4(A[2]),
        .I5(\Result[22]_INST_0_i_5_n_0 ),
        .O(\Result[16]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \Result[16]_INST_0_i_5 
       (.I0(B[1]),
        .I1(A[3]),
        .I2(B[9]),
        .I3(A[4]),
        .O(\Result[16]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[17]_INST_0_i_2 
       (.I0(\Result[17]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[18]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[17]_INST_0_i_4_n_0 ),
        .O(\Result[17]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[17]_INST_0_i_3 
       (.I0(A[17]),
        .I1(B[17]),
        .O(\Result[17]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[17]_INST_0_i_4 
       (.I0(\Result[17]_INST_0_i_5_n_0 ),
        .I1(\Result[21]_INST_0_i_5_n_0 ),
        .I2(A[1]),
        .I3(\Result[19]_INST_0_i_10_n_0 ),
        .I4(A[2]),
        .I5(\Result[23]_INST_0_i_10_n_0 ),
        .O(\Result[17]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \Result[17]_INST_0_i_5 
       (.I0(B[2]),
        .I1(A[3]),
        .I2(B[10]),
        .I3(A[4]),
        .O(\Result[17]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[18]_INST_0_i_2 
       (.I0(\Result[18]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[19]_INST_0_i_5_n_0 ),
        .I4(A[0]),
        .I5(\Result[18]_INST_0_i_4_n_0 ),
        .O(\Result[18]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[18]_INST_0_i_3 
       (.I0(A[18]),
        .I1(B[18]),
        .O(\Result[18]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[18]_INST_0_i_4 
       (.I0(\Result[18]_INST_0_i_5_n_0 ),
        .I1(\Result[22]_INST_0_i_5_n_0 ),
        .I2(A[1]),
        .I3(\Result[20]_INST_0_i_5_n_0 ),
        .I4(A[2]),
        .I5(\Result[24]_INST_0_i_5_n_0 ),
        .O(\Result[18]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \Result[18]_INST_0_i_5 
       (.I0(B[3]),
        .I1(A[3]),
        .I2(B[11]),
        .I3(A[4]),
        .O(\Result[18]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \Result[19]_INST_0_i_10 
       (.I0(B[4]),
        .I1(A[3]),
        .I2(B[12]),
        .I3(A[4]),
        .O(\Result[19]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[19]_INST_0_i_2 
       (.I0(\Result[19]_INST_0_i_4_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[20]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[19]_INST_0_i_5_n_0 ),
        .O(\Result[19]_INST_0_i_2_n_0 ));
  CARRY4 \Result[19]_INST_0_i_3 
       (.CI(\Result[15]_INST_0_i_4_n_0 ),
        .CO({\Result[19]_INST_0_i_3_n_0 ,\Result[19]_INST_0_i_3_n_1 ,\Result[19]_INST_0_i_3_n_2 ,\Result[19]_INST_0_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI(A[19:16]),
        .O({\Result[19]_INST_0_i_3_n_4 ,\Result[19]_INST_0_i_3_n_5 ,\Result[19]_INST_0_i_3_n_6 ,\Result[19]_INST_0_i_3_n_7 }),
        .S({\Result[19]_INST_0_i_6_n_0 ,\Result[19]_INST_0_i_7_n_0 ,\Result[19]_INST_0_i_8_n_0 ,\Result[19]_INST_0_i_9_n_0 }));
  LUT2 #(
    .INIT(4'hE)) 
    \Result[19]_INST_0_i_4 
       (.I0(A[19]),
        .I1(B[19]),
        .O(\Result[19]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[19]_INST_0_i_5 
       (.I0(\Result[19]_INST_0_i_10_n_0 ),
        .I1(\Result[23]_INST_0_i_10_n_0 ),
        .I2(A[1]),
        .I3(\Result[21]_INST_0_i_5_n_0 ),
        .I4(A[2]),
        .I5(\Result[25]_INST_0_i_5_n_0 ),
        .O(\Result[19]_INST_0_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[19]_INST_0_i_6 
       (.I0(A[19]),
        .I1(B[19]),
        .O(\Result[19]_INST_0_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[19]_INST_0_i_7 
       (.I0(A[18]),
        .I1(B[18]),
        .O(\Result[19]_INST_0_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[19]_INST_0_i_8 
       (.I0(A[17]),
        .I1(B[17]),
        .O(\Result[19]_INST_0_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[19]_INST_0_i_9 
       (.I0(A[16]),
        .I1(B[16]),
        .O(\Result[19]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[1]_INST_0_i_2 
       (.I0(\Result[1]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[2]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[1]_INST_0_i_4_n_0 ),
        .O(\Result[1]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[1]_INST_0_i_3 
       (.I0(A[1]),
        .I1(B[1]),
        .O(\Result[1]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000010)) 
    \Result[1]_INST_0_i_4 
       (.I0(A[2]),
        .I1(A[4]),
        .I2(B[0]),
        .I3(A[3]),
        .I4(A[1]),
        .O(\Result[1]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[20]_INST_0_i_2 
       (.I0(\Result[20]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[21]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[20]_INST_0_i_4_n_0 ),
        .O(\Result[20]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \Result[20]_INST_0_i_3 
       (.I0(A[20]),
        .I1(B[20]),
        .O(\Result[20]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[20]_INST_0_i_4 
       (.I0(\Result[20]_INST_0_i_5_n_0 ),
        .I1(\Result[24]_INST_0_i_5_n_0 ),
        .I2(A[1]),
        .I3(\Result[22]_INST_0_i_5_n_0 ),
        .I4(A[2]),
        .I5(\Result[26]_INST_0_i_5_n_0 ),
        .O(\Result[20]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \Result[20]_INST_0_i_5 
       (.I0(B[5]),
        .I1(A[3]),
        .I2(B[13]),
        .I3(A[4]),
        .O(\Result[20]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[21]_INST_0_i_2 
       (.I0(\Result[21]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[22]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[21]_INST_0_i_4_n_0 ),
        .O(\Result[21]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[21]_INST_0_i_3 
       (.I0(A[21]),
        .I1(B[21]),
        .O(\Result[21]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[21]_INST_0_i_4 
       (.I0(\Result[21]_INST_0_i_5_n_0 ),
        .I1(\Result[25]_INST_0_i_5_n_0 ),
        .I2(A[1]),
        .I3(\Result[23]_INST_0_i_10_n_0 ),
        .I4(A[2]),
        .I5(\Result[27]_INST_0_i_10_n_0 ),
        .O(\Result[21]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \Result[21]_INST_0_i_5 
       (.I0(B[6]),
        .I1(A[3]),
        .I2(B[14]),
        .I3(A[4]),
        .O(\Result[21]_INST_0_i_5_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \Result[22]_INST_0_i_2 
       (.I0(A[22]),
        .I1(B[22]),
        .O(\Result[22]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hA808)) 
    \Result[22]_INST_0_i_3 
       (.I0(Zero_INST_0_i_55_n_0),
        .I1(\Result[23]_INST_0_i_5_n_0 ),
        .I2(A[0]),
        .I3(\Result[22]_INST_0_i_4_n_0 ),
        .O(\Result[22]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[22]_INST_0_i_4 
       (.I0(\Result[22]_INST_0_i_5_n_0 ),
        .I1(\Result[26]_INST_0_i_5_n_0 ),
        .I2(A[1]),
        .I3(\Result[24]_INST_0_i_5_n_0 ),
        .I4(A[2]),
        .I5(\Result[28]_INST_0_i_5_n_0 ),
        .O(\Result[22]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \Result[22]_INST_0_i_5 
       (.I0(B[7]),
        .I1(A[3]),
        .I2(B[15]),
        .I3(A[4]),
        .O(\Result[22]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \Result[23]_INST_0_i_10 
       (.I0(B[8]),
        .I1(A[3]),
        .I2(B[0]),
        .I3(A[4]),
        .I4(B[16]),
        .O(\Result[23]_INST_0_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[23]_INST_0_i_2 
       (.I0(A[23]),
        .I1(B[23]),
        .O(\Result[23]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hA808)) 
    \Result[23]_INST_0_i_3 
       (.I0(Zero_INST_0_i_55_n_0),
        .I1(\Result[24]_INST_0_i_4_n_0 ),
        .I2(A[0]),
        .I3(\Result[23]_INST_0_i_5_n_0 ),
        .O(\Result[23]_INST_0_i_3_n_0 ));
  CARRY4 \Result[23]_INST_0_i_4 
       (.CI(\Result[19]_INST_0_i_3_n_0 ),
        .CO({\Result[23]_INST_0_i_4_n_0 ,\Result[23]_INST_0_i_4_n_1 ,\Result[23]_INST_0_i_4_n_2 ,\Result[23]_INST_0_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI(A[23:20]),
        .O({\Result[23]_INST_0_i_4_n_4 ,\Result[23]_INST_0_i_4_n_5 ,\Result[23]_INST_0_i_4_n_6 ,\Result[23]_INST_0_i_4_n_7 }),
        .S({\Result[23]_INST_0_i_6_n_0 ,\Result[23]_INST_0_i_7_n_0 ,\Result[23]_INST_0_i_8_n_0 ,\Result[23]_INST_0_i_9_n_0 }));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[23]_INST_0_i_5 
       (.I0(\Result[23]_INST_0_i_10_n_0 ),
        .I1(\Result[27]_INST_0_i_10_n_0 ),
        .I2(A[1]),
        .I3(\Result[25]_INST_0_i_5_n_0 ),
        .I4(A[2]),
        .I5(\Result[29]_INST_0_i_5_n_0 ),
        .O(\Result[23]_INST_0_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[23]_INST_0_i_6 
       (.I0(A[23]),
        .I1(B[23]),
        .O(\Result[23]_INST_0_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[23]_INST_0_i_7 
       (.I0(A[22]),
        .I1(B[22]),
        .O(\Result[23]_INST_0_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[23]_INST_0_i_8 
       (.I0(A[21]),
        .I1(B[21]),
        .O(\Result[23]_INST_0_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[23]_INST_0_i_9 
       (.I0(A[20]),
        .I1(B[20]),
        .O(\Result[23]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[24]_INST_0_i_2 
       (.I0(\Result[24]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[25]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[24]_INST_0_i_4_n_0 ),
        .O(\Result[24]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \Result[24]_INST_0_i_3 
       (.I0(A[24]),
        .I1(B[24]),
        .O(\Result[24]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[24]_INST_0_i_4 
       (.I0(\Result[24]_INST_0_i_5_n_0 ),
        .I1(\Result[28]_INST_0_i_5_n_0 ),
        .I2(A[1]),
        .I3(\Result[26]_INST_0_i_5_n_0 ),
        .I4(A[2]),
        .I5(\Result[30]_INST_0_i_5_n_0 ),
        .O(\Result[24]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \Result[24]_INST_0_i_5 
       (.I0(B[9]),
        .I1(A[3]),
        .I2(B[1]),
        .I3(A[4]),
        .I4(B[17]),
        .O(\Result[24]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[25]_INST_0_i_2 
       (.I0(\Result[25]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[26]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[25]_INST_0_i_4_n_0 ),
        .O(\Result[25]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[25]_INST_0_i_3 
       (.I0(A[25]),
        .I1(B[25]),
        .O(\Result[25]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[25]_INST_0_i_4 
       (.I0(\Result[25]_INST_0_i_5_n_0 ),
        .I1(\Result[29]_INST_0_i_5_n_0 ),
        .I2(A[1]),
        .I3(\Result[27]_INST_0_i_10_n_0 ),
        .I4(A[2]),
        .I5(\Result[31]_INST_0_i_22_n_0 ),
        .O(\Result[25]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \Result[25]_INST_0_i_5 
       (.I0(B[10]),
        .I1(A[3]),
        .I2(B[2]),
        .I3(A[4]),
        .I4(B[18]),
        .O(\Result[25]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[26]_INST_0_i_2 
       (.I0(\Result[26]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[27]_INST_0_i_5_n_0 ),
        .I4(A[0]),
        .I5(\Result[26]_INST_0_i_4_n_0 ),
        .O(\Result[26]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[26]_INST_0_i_3 
       (.I0(A[26]),
        .I1(B[26]),
        .O(\Result[26]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[26]_INST_0_i_4 
       (.I0(\Result[26]_INST_0_i_5_n_0 ),
        .I1(\Result[30]_INST_0_i_5_n_0 ),
        .I2(A[1]),
        .I3(\Result[28]_INST_0_i_5_n_0 ),
        .I4(A[2]),
        .I5(\Result[31]_INST_0_i_18_n_0 ),
        .O(\Result[26]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \Result[26]_INST_0_i_5 
       (.I0(B[11]),
        .I1(A[3]),
        .I2(B[3]),
        .I3(A[4]),
        .I4(B[19]),
        .O(\Result[26]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \Result[27]_INST_0_i_10 
       (.I0(B[12]),
        .I1(A[3]),
        .I2(B[4]),
        .I3(A[4]),
        .I4(B[20]),
        .O(\Result[27]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[27]_INST_0_i_2 
       (.I0(\Result[27]_INST_0_i_4_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[28]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[27]_INST_0_i_5_n_0 ),
        .O(\Result[27]_INST_0_i_2_n_0 ));
  CARRY4 \Result[27]_INST_0_i_3 
       (.CI(\Result[23]_INST_0_i_4_n_0 ),
        .CO({\Result[27]_INST_0_i_3_n_0 ,\Result[27]_INST_0_i_3_n_1 ,\Result[27]_INST_0_i_3_n_2 ,\Result[27]_INST_0_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI(A[27:24]),
        .O({\Result[27]_INST_0_i_3_n_4 ,\Result[27]_INST_0_i_3_n_5 ,\Result[27]_INST_0_i_3_n_6 ,\Result[27]_INST_0_i_3_n_7 }),
        .S({\Result[27]_INST_0_i_6_n_0 ,\Result[27]_INST_0_i_7_n_0 ,\Result[27]_INST_0_i_8_n_0 ,\Result[27]_INST_0_i_9_n_0 }));
  LUT2 #(
    .INIT(4'hE)) 
    \Result[27]_INST_0_i_4 
       (.I0(A[27]),
        .I1(B[27]),
        .O(\Result[27]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[27]_INST_0_i_5 
       (.I0(\Result[27]_INST_0_i_10_n_0 ),
        .I1(\Result[31]_INST_0_i_22_n_0 ),
        .I2(A[1]),
        .I3(\Result[29]_INST_0_i_5_n_0 ),
        .I4(A[2]),
        .I5(\Result[31]_INST_0_i_24_n_0 ),
        .O(\Result[27]_INST_0_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[27]_INST_0_i_6 
       (.I0(A[27]),
        .I1(B[27]),
        .O(\Result[27]_INST_0_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[27]_INST_0_i_7 
       (.I0(A[26]),
        .I1(B[26]),
        .O(\Result[27]_INST_0_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[27]_INST_0_i_8 
       (.I0(A[25]),
        .I1(B[25]),
        .O(\Result[27]_INST_0_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[27]_INST_0_i_9 
       (.I0(A[24]),
        .I1(B[24]),
        .O(\Result[27]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[28]_INST_0_i_2 
       (.I0(\Result[28]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[29]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[28]_INST_0_i_4_n_0 ),
        .O(\Result[28]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \Result[28]_INST_0_i_3 
       (.I0(A[28]),
        .I1(B[28]),
        .O(\Result[28]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[28]_INST_0_i_4 
       (.I0(\Result[28]_INST_0_i_5_n_0 ),
        .I1(\Result[31]_INST_0_i_18_n_0 ),
        .I2(A[1]),
        .I3(\Result[30]_INST_0_i_5_n_0 ),
        .I4(A[2]),
        .I5(\Result[31]_INST_0_i_20_n_0 ),
        .O(\Result[28]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \Result[28]_INST_0_i_5 
       (.I0(B[13]),
        .I1(A[3]),
        .I2(B[5]),
        .I3(A[4]),
        .I4(B[21]),
        .O(\Result[28]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[29]_INST_0_i_2 
       (.I0(\Result[29]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[30]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[29]_INST_0_i_4_n_0 ),
        .O(\Result[29]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[29]_INST_0_i_3 
       (.I0(A[29]),
        .I1(B[29]),
        .O(\Result[29]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[29]_INST_0_i_4 
       (.I0(\Result[29]_INST_0_i_5_n_0 ),
        .I1(\Result[31]_INST_0_i_24_n_0 ),
        .I2(A[1]),
        .I3(\Result[31]_INST_0_i_22_n_0 ),
        .I4(A[2]),
        .I5(\Result[31]_INST_0_i_23_n_0 ),
        .O(\Result[29]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \Result[29]_INST_0_i_5 
       (.I0(B[14]),
        .I1(A[3]),
        .I2(B[6]),
        .I3(A[4]),
        .I4(B[22]),
        .O(\Result[29]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[2]_INST_0_i_2 
       (.I0(\Result[2]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[3]_INST_0_i_5_n_0 ),
        .I4(A[0]),
        .I5(\Result[2]_INST_0_i_4_n_0 ),
        .O(\Result[2]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[2]_INST_0_i_3 
       (.I0(A[2]),
        .I1(B[2]),
        .O(\Result[2]_INST_0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \Result[2]_INST_0_i_4 
       (.I0(A[2]),
        .I1(A[4]),
        .I2(B[1]),
        .I3(A[3]),
        .I4(A[1]),
        .O(\Result[2]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[30]_INST_0_i_2 
       (.I0(\Result[30]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[31]_INST_0_i_9_n_0 ),
        .I4(A[0]),
        .I5(\Result[30]_INST_0_i_4_n_0 ),
        .O(\Result[30]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \Result[30]_INST_0_i_3 
       (.I0(A[30]),
        .I1(B[30]),
        .O(\Result[30]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[30]_INST_0_i_4 
       (.I0(\Result[30]_INST_0_i_5_n_0 ),
        .I1(\Result[31]_INST_0_i_20_n_0 ),
        .I2(A[1]),
        .I3(\Result[31]_INST_0_i_18_n_0 ),
        .I4(A[2]),
        .I5(\Result[31]_INST_0_i_19_n_0 ),
        .O(\Result[30]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \Result[30]_INST_0_i_5 
       (.I0(B[15]),
        .I1(A[3]),
        .I2(B[7]),
        .I3(A[4]),
        .I4(B[23]),
        .O(\Result[30]_INST_0_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[31]_INST_0_i_10 
       (.I0(A[31]),
        .I1(B[31]),
        .O(\Result[31]_INST_0_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[31]_INST_0_i_11 
       (.I0(A[30]),
        .I1(B[30]),
        .O(\Result[31]_INST_0_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[31]_INST_0_i_12 
       (.I0(A[29]),
        .I1(B[29]),
        .O(\Result[31]_INST_0_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[31]_INST_0_i_13 
       (.I0(A[28]),
        .I1(B[28]),
        .O(\Result[31]_INST_0_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \Result[31]_INST_0_i_14 
       (.I0(A[15]),
        .I1(A[16]),
        .I2(A[13]),
        .I3(A[14]),
        .O(\Result[31]_INST_0_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \Result[31]_INST_0_i_15 
       (.I0(A[7]),
        .I1(A[8]),
        .I2(A[5]),
        .I3(A[6]),
        .O(\Result[31]_INST_0_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \Result[31]_INST_0_i_16 
       (.I0(A[23]),
        .I1(A[24]),
        .I2(A[21]),
        .I3(A[22]),
        .O(\Result[31]_INST_0_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \Result[31]_INST_0_i_17 
       (.I0(A[27]),
        .I1(A[28]),
        .I2(A[25]),
        .I3(A[26]),
        .O(\Result[31]_INST_0_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[31]_INST_0_i_18 
       (.I0(B[1]),
        .I1(B[17]),
        .I2(A[3]),
        .I3(B[9]),
        .I4(A[4]),
        .I5(B[25]),
        .O(\Result[31]_INST_0_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[31]_INST_0_i_19 
       (.I0(B[5]),
        .I1(B[21]),
        .I2(A[3]),
        .I3(B[13]),
        .I4(A[4]),
        .I5(B[29]),
        .O(\Result[31]_INST_0_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[31]_INST_0_i_2 
       (.I0(A[31]),
        .I1(B[31]),
        .O(p_4_in));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[31]_INST_0_i_20 
       (.I0(B[3]),
        .I1(B[19]),
        .I2(A[3]),
        .I3(B[11]),
        .I4(A[4]),
        .I5(B[27]),
        .O(\Result[31]_INST_0_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[31]_INST_0_i_21 
       (.I0(B[7]),
        .I1(B[23]),
        .I2(A[3]),
        .I3(B[15]),
        .I4(A[4]),
        .I5(B[31]),
        .O(\Result[31]_INST_0_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[31]_INST_0_i_22 
       (.I0(B[0]),
        .I1(B[16]),
        .I2(A[3]),
        .I3(B[8]),
        .I4(A[4]),
        .I5(B[24]),
        .O(\Result[31]_INST_0_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[31]_INST_0_i_23 
       (.I0(B[4]),
        .I1(B[20]),
        .I2(A[3]),
        .I3(B[12]),
        .I4(A[4]),
        .I5(B[28]),
        .O(\Result[31]_INST_0_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[31]_INST_0_i_24 
       (.I0(B[2]),
        .I1(B[18]),
        .I2(A[3]),
        .I3(B[10]),
        .I4(A[4]),
        .I5(B[26]),
        .O(\Result[31]_INST_0_i_24_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[31]_INST_0_i_25 
       (.I0(B[6]),
        .I1(B[22]),
        .I2(A[3]),
        .I3(B[14]),
        .I4(A[4]),
        .I5(B[30]),
        .O(\Result[31]_INST_0_i_25_n_0 ));
  LUT6 #(
    .INIT(64'h0101010000000100)) 
    \Result[31]_INST_0_i_3 
       (.I0(\Result[31]_INST_0_i_5_n_0 ),
        .I1(\Result[31]_INST_0_i_6_n_0 ),
        .I2(\Result[31]_INST_0_i_7_n_0 ),
        .I3(\Result[31]_INST_0_i_8_n_0 ),
        .I4(A[0]),
        .I5(\Result[31]_INST_0_i_9_n_0 ),
        .O(data2));
  CARRY4 \Result[31]_INST_0_i_4 
       (.CI(\Result[27]_INST_0_i_3_n_0 ),
        .CO({\NLW_Result[31]_INST_0_i_4_CO_UNCONNECTED [3],\Result[31]_INST_0_i_4_n_1 ,\Result[31]_INST_0_i_4_n_2 ,\Result[31]_INST_0_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,A[30:28]}),
        .O({data0,\Result[31]_INST_0_i_4_n_5 ,\Result[31]_INST_0_i_4_n_6 ,\Result[31]_INST_0_i_4_n_7 }),
        .S({\Result[31]_INST_0_i_10_n_0 ,\Result[31]_INST_0_i_11_n_0 ,\Result[31]_INST_0_i_12_n_0 ,\Result[31]_INST_0_i_13_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \Result[31]_INST_0_i_5 
       (.I0(A[18]),
        .I1(A[17]),
        .I2(A[20]),
        .I3(A[19]),
        .I4(\Result[31]_INST_0_i_14_n_0 ),
        .O(\Result[31]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \Result[31]_INST_0_i_6 
       (.I0(A[10]),
        .I1(A[9]),
        .I2(A[12]),
        .I3(A[11]),
        .I4(\Result[31]_INST_0_i_15_n_0 ),
        .O(\Result[31]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \Result[31]_INST_0_i_7 
       (.I0(A[30]),
        .I1(A[29]),
        .I2(A[31]),
        .I3(\Result[31]_INST_0_i_16_n_0 ),
        .I4(\Result[31]_INST_0_i_17_n_0 ),
        .O(\Result[31]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[31]_INST_0_i_8 
       (.I0(\Result[31]_INST_0_i_18_n_0 ),
        .I1(\Result[31]_INST_0_i_19_n_0 ),
        .I2(A[1]),
        .I3(\Result[31]_INST_0_i_20_n_0 ),
        .I4(A[2]),
        .I5(\Result[31]_INST_0_i_21_n_0 ),
        .O(\Result[31]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Result[31]_INST_0_i_9 
       (.I0(\Result[31]_INST_0_i_22_n_0 ),
        .I1(\Result[31]_INST_0_i_23_n_0 ),
        .I2(A[1]),
        .I3(\Result[31]_INST_0_i_24_n_0 ),
        .I4(A[2]),
        .I5(\Result[31]_INST_0_i_25_n_0 ),
        .O(\Result[31]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[3]_INST_0_i_2 
       (.I0(\Result[3]_INST_0_i_4_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[4]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[3]_INST_0_i_5_n_0 ),
        .O(\Result[3]_INST_0_i_2_n_0 ));
  CARRY4 \Result[3]_INST_0_i_3 
       (.CI(1'b0),
        .CO({\Result[3]_INST_0_i_3_n_0 ,\Result[3]_INST_0_i_3_n_1 ,\Result[3]_INST_0_i_3_n_2 ,\Result[3]_INST_0_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI(A[3:0]),
        .O({\Result[3]_INST_0_i_3_n_4 ,\Result[3]_INST_0_i_3_n_5 ,\Result[3]_INST_0_i_3_n_6 ,\Result[3]_INST_0_i_3_n_7 }),
        .S({\Result[3]_INST_0_i_6_n_0 ,\Result[3]_INST_0_i_7_n_0 ,\Result[3]_INST_0_i_8_n_0 ,\Result[3]_INST_0_i_9_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[3]_INST_0_i_4 
       (.I0(A[3]),
        .I1(B[3]),
        .O(\Result[3]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000B08)) 
    \Result[3]_INST_0_i_5 
       (.I0(B[0]),
        .I1(A[1]),
        .I2(A[3]),
        .I3(B[2]),
        .I4(A[4]),
        .I5(A[2]),
        .O(\Result[3]_INST_0_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[3]_INST_0_i_6 
       (.I0(A[3]),
        .I1(B[3]),
        .O(\Result[3]_INST_0_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[3]_INST_0_i_7 
       (.I0(A[2]),
        .I1(B[2]),
        .O(\Result[3]_INST_0_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[3]_INST_0_i_8 
       (.I0(A[1]),
        .I1(B[1]),
        .O(\Result[3]_INST_0_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[3]_INST_0_i_9 
       (.I0(A[0]),
        .I1(B[0]),
        .O(\Result[3]_INST_0_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[4]_INST_0_i_2 
       (.I0(A[4]),
        .I1(B[4]),
        .O(\Result[4]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'hA808)) 
    \Result[4]_INST_0_i_3 
       (.I0(Zero_INST_0_i_55_n_0),
        .I1(\Result[5]_INST_0_i_4_n_0 ),
        .I2(A[0]),
        .I3(\Result[4]_INST_0_i_4_n_0 ),
        .O(\Result[4]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000B08)) 
    \Result[4]_INST_0_i_4 
       (.I0(B[1]),
        .I1(A[1]),
        .I2(A[3]),
        .I3(B[3]),
        .I4(A[4]),
        .I5(A[2]),
        .O(\Result[4]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[5]_INST_0_i_2 
       (.I0(A[5]),
        .I1(B[5]),
        .O(\Result[5]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'hA808)) 
    \Result[5]_INST_0_i_3 
       (.I0(Zero_INST_0_i_55_n_0),
        .I1(\Result[6]_INST_0_i_4_n_0 ),
        .I2(A[0]),
        .I3(\Result[5]_INST_0_i_4_n_0 ),
        .O(\Result[5]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0004FFFF00040000)) 
    \Result[5]_INST_0_i_4 
       (.I0(A[3]),
        .I1(B[2]),
        .I2(A[4]),
        .I3(A[2]),
        .I4(A[1]),
        .I5(\Result[7]_INST_0_i_5_n_0 ),
        .O(\Result[5]_INST_0_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \Result[6]_INST_0_i_2 
       (.I0(A[6]),
        .I1(B[6]),
        .O(\Result[6]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF00B8000000B800)) 
    \Result[6]_INST_0_i_3 
       (.I0(\Result[7]_INST_0_i_5_n_0 ),
        .I1(A[1]),
        .I2(\Result[7]_INST_0_i_6_n_0 ),
        .I3(Zero_INST_0_i_55_n_0),
        .I4(A[0]),
        .I5(\Result[6]_INST_0_i_4_n_0 ),
        .O(\Result[6]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0004FFFF00040000)) 
    \Result[6]_INST_0_i_4 
       (.I0(A[3]),
        .I1(B[3]),
        .I2(A[4]),
        .I3(A[2]),
        .I4(A[1]),
        .I5(Zero_INST_0_i_101_n_0),
        .O(\Result[6]_INST_0_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[7]_INST_0_i_10 
       (.I0(A[4]),
        .I1(B[4]),
        .O(\Result[7]_INST_0_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[7]_INST_0_i_2 
       (.I0(A[7]),
        .I1(B[7]),
        .O(\Result[7]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB800B800FF000000)) 
    \Result[7]_INST_0_i_3 
       (.I0(\Result[7]_INST_0_i_5_n_0 ),
        .I1(A[1]),
        .I2(\Result[7]_INST_0_i_6_n_0 ),
        .I3(Zero_INST_0_i_55_n_0),
        .I4(\Result[8]_INST_0_i_4_n_0 ),
        .I5(A[0]),
        .O(\Result[7]_INST_0_i_3_n_0 ));
  CARRY4 \Result[7]_INST_0_i_4 
       (.CI(\Result[3]_INST_0_i_3_n_0 ),
        .CO({\Result[7]_INST_0_i_4_n_0 ,\Result[7]_INST_0_i_4_n_1 ,\Result[7]_INST_0_i_4_n_2 ,\Result[7]_INST_0_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI(A[7:4]),
        .O({\Result[7]_INST_0_i_4_n_4 ,\Result[7]_INST_0_i_4_n_5 ,\Result[7]_INST_0_i_4_n_6 ,\Result[7]_INST_0_i_4_n_7 }),
        .S({\Result[7]_INST_0_i_7_n_0 ,\Result[7]_INST_0_i_8_n_0 ,\Result[7]_INST_0_i_9_n_0 ,\Result[7]_INST_0_i_10_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00000B08)) 
    \Result[7]_INST_0_i_5 
       (.I0(B[0]),
        .I1(A[2]),
        .I2(A[4]),
        .I3(B[4]),
        .I4(A[3]),
        .O(\Result[7]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00000B08)) 
    \Result[7]_INST_0_i_6 
       (.I0(B[2]),
        .I1(A[2]),
        .I2(A[4]),
        .I3(B[6]),
        .I4(A[3]),
        .O(\Result[7]_INST_0_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[7]_INST_0_i_7 
       (.I0(A[7]),
        .I1(B[7]),
        .O(\Result[7]_INST_0_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[7]_INST_0_i_8 
       (.I0(A[6]),
        .I1(B[6]),
        .O(\Result[7]_INST_0_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Result[7]_INST_0_i_9 
       (.I0(A[5]),
        .I1(B[5]),
        .O(\Result[7]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[8]_INST_0_i_2 
       (.I0(\Result[8]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[9]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[8]_INST_0_i_4_n_0 ),
        .O(\Result[8]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \Result[8]_INST_0_i_3 
       (.I0(A[8]),
        .I1(B[8]),
        .O(\Result[8]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \Result[8]_INST_0_i_4 
       (.I0(Zero_INST_0_i_101_n_0),
        .I1(A[1]),
        .I2(Zero_INST_0_i_102_n_0),
        .O(\Result[8]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8888888B888)) 
    \Result[9]_INST_0_i_2 
       (.I0(\Result[9]_INST_0_i_3_n_0 ),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(\Result[10]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[9]_INST_0_i_4_n_0 ),
        .O(\Result[9]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Result[9]_INST_0_i_3 
       (.I0(A[9]),
        .I1(B[9]),
        .O(\Result[9]_INST_0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Result[9]_INST_0_i_4 
       (.I0(\Result[7]_INST_0_i_6_n_0 ),
        .I1(A[1]),
        .I2(\Result[11]_INST_0_i_10_n_0 ),
        .O(\Result[9]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    Zero_INST_0_i_10
       (.I0(Zero_INST_0_i_40_n_0),
        .I1(B[23]),
        .I2(A[23]),
        .I3(B[22]),
        .I4(A[22]),
        .I5(Zero_INST_0_i_41_n_0),
        .O(Zero_INST_0_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    Zero_INST_0_i_100
       (.I0(A[26]),
        .I1(A[25]),
        .I2(A[28]),
        .I3(A[27]),
        .I4(\Result[31]_INST_0_i_16_n_0 ),
        .O(Zero_INST_0_i_100_n_0));
  LUT5 #(
    .INIT(32'h00000B08)) 
    Zero_INST_0_i_101
       (.I0(B[1]),
        .I1(A[2]),
        .I2(A[4]),
        .I3(B[5]),
        .I4(A[3]),
        .O(Zero_INST_0_i_101_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000B08)) 
    Zero_INST_0_i_102
       (.I0(B[3]),
        .I1(A[2]),
        .I2(A[4]),
        .I3(B[7]),
        .I4(A[3]),
        .O(Zero_INST_0_i_102_n_0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    Zero_INST_0_i_103
       (.I0(\Result[2]_INST_0_i_4_n_0 ),
        .I1(A[0]),
        .I2(\Result[3]_INST_0_i_5_n_0 ),
        .O(Zero_INST_0_i_103_n_0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    Zero_INST_0_i_104
       (.I0(\Result[3]_INST_0_i_5_n_0 ),
        .I1(A[0]),
        .I2(\Result[4]_INST_0_i_4_n_0 ),
        .O(Zero_INST_0_i_104_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    Zero_INST_0_i_105
       (.I0(A[1]),
        .I1(A[3]),
        .I2(B[0]),
        .I3(A[4]),
        .I4(A[2]),
        .I5(A[0]),
        .O(Zero_INST_0_i_105_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    Zero_INST_0_i_106
       (.I0(\Result[1]_INST_0_i_4_n_0 ),
        .I1(A[0]),
        .I2(\Result[2]_INST_0_i_4_n_0 ),
        .O(Zero_INST_0_i_106_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    Zero_INST_0_i_107
       (.I0(Zero_INST_0_i_102_n_0),
        .I1(\Result[12]_INST_0_i_5_n_0 ),
        .I2(A[0]),
        .I3(\Result[11]_INST_0_i_10_n_0 ),
        .I4(A[1]),
        .I5(\Result[13]_INST_0_i_5_n_0 ),
        .O(Zero_INST_0_i_107_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    Zero_INST_0_i_108
       (.I0(\Result[11]_INST_0_i_10_n_0 ),
        .I1(\Result[13]_INST_0_i_5_n_0 ),
        .I2(A[0]),
        .I3(\Result[12]_INST_0_i_5_n_0 ),
        .I4(A[1]),
        .I5(\Result[14]_INST_0_i_5_n_0 ),
        .O(Zero_INST_0_i_108_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    Zero_INST_0_i_109
       (.I0(Zero_INST_0_i_101_n_0),
        .I1(Zero_INST_0_i_102_n_0),
        .I2(A[0]),
        .I3(\Result[7]_INST_0_i_6_n_0 ),
        .I4(A[1]),
        .I5(\Result[11]_INST_0_i_10_n_0 ),
        .O(Zero_INST_0_i_109_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    Zero_INST_0_i_11
       (.I0(Zero_INST_0_i_42_n_0),
        .I1(B[30]),
        .I2(A[30]),
        .I3(B[31]),
        .I4(A[31]),
        .I5(Zero_INST_0_i_43_n_0),
        .O(Zero_INST_0_i_11_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    Zero_INST_0_i_110
       (.I0(\Result[7]_INST_0_i_6_n_0 ),
        .I1(\Result[11]_INST_0_i_10_n_0 ),
        .I2(A[0]),
        .I3(Zero_INST_0_i_102_n_0),
        .I4(A[1]),
        .I5(\Result[12]_INST_0_i_5_n_0 ),
        .O(Zero_INST_0_i_110_n_0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_111
       (.I0(B[17]),
        .I1(A[17]),
        .I2(B[16]),
        .I3(A[16]),
        .O(Zero_INST_0_i_111_n_0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_112
       (.I0(B[25]),
        .I1(A[25]),
        .I2(B[24]),
        .I3(A[24]),
        .O(Zero_INST_0_i_112_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_113
       (.I0(B[1]),
        .I1(A[1]),
        .I2(B[0]),
        .I3(A[0]),
        .O(Zero_INST_0_i_113_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_114
       (.I0(B[9]),
        .I1(A[9]),
        .I2(B[8]),
        .I3(A[8]),
        .O(Zero_INST_0_i_114_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_115
       (.I0(A[19]),
        .I1(A[20]),
        .I2(A[17]),
        .I3(A[18]),
        .O(Zero_INST_0_i_115_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_116
       (.I0(A[11]),
        .I1(A[12]),
        .I2(A[9]),
        .I3(A[10]),
        .O(Zero_INST_0_i_116_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    Zero_INST_0_i_12
       (.I0(Zero_INST_0_i_44_n_0),
        .I1(B[7]),
        .I2(A[7]),
        .I3(B[6]),
        .I4(A[6]),
        .I5(Zero_INST_0_i_45_n_0),
        .O(Zero_INST_0_i_12_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    Zero_INST_0_i_13
       (.I0(Zero_INST_0_i_46_n_0),
        .I1(B[15]),
        .I2(A[15]),
        .I3(B[14]),
        .I4(A[14]),
        .I5(Zero_INST_0_i_47_n_0),
        .O(Zero_INST_0_i_13_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    Zero_INST_0_i_14
       (.I0(Zero_INST_0_i_48_n_0),
        .I1(Zero_INST_0_i_49_n_0),
        .I2(Zero_INST_0_i_50_n_0),
        .I3(Zero_INST_0_i_51_n_0),
        .O(Zero_INST_0_i_14_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEAA)) 
    Zero_INST_0_i_15
       (.I0(Zero_INST_0_i_52_n_0),
        .I1(Zero_INST_0_i_53_n_0),
        .I2(Zero_INST_0_i_54_n_0),
        .I3(Zero_INST_0_i_55_n_0),
        .I4(Zero_INST_0_i_56_n_0),
        .I5(Zero_INST_0_i_57_n_0),
        .O(Zero_INST_0_i_15_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    Zero_INST_0_i_16
       (.I0(Zero_INST_0_i_58_n_0),
        .I1(Zero_INST_0_i_59_n_0),
        .I2(Zero_INST_0_i_60_n_0),
        .I3(data2),
        .I4(Zero_INST_0_i_61_n_0),
        .I5(Zero_INST_0_i_62_n_0),
        .O(Zero_INST_0_i_16_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFF0F0F0E0)) 
    Zero_INST_0_i_17
       (.I0(Zero_INST_0_i_63_n_0),
        .I1(Zero_INST_0_i_64_n_0),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(Zero_INST_0_i_65_n_0),
        .I4(Zero_INST_0_i_66_n_0),
        .I5(Zero_INST_0_i_67_n_0),
        .O(Zero_INST_0_i_17_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFF0F0F0E0)) 
    Zero_INST_0_i_18
       (.I0(Zero_INST_0_i_68_n_0),
        .I1(Zero_INST_0_i_69_n_0),
        .I2(Zero_INST_0_i_55_n_0),
        .I3(Zero_INST_0_i_70_n_0),
        .I4(Zero_INST_0_i_71_n_0),
        .I5(Zero_INST_0_i_72_n_0),
        .O(Zero_INST_0_i_18_n_0));
  LUT4 #(
    .INIT(16'h4000)) 
    Zero_INST_0_i_22
       (.I0(Zero_INST_0_i_79_n_0),
        .I1(Zero_INST_0_i_80_n_0),
        .I2(Zero_INST_0_i_81_n_0),
        .I3(Zero_INST_0_i_82_n_0),
        .O(Zero_INST_0_i_22_n_0));
  LUT4 #(
    .INIT(16'hFBFF)) 
    Zero_INST_0_i_23
       (.I0(Zero_INST_0_i_83_n_0),
        .I1(Zero_INST_0_i_84_n_0),
        .I2(Zero_INST_0_i_85_n_0),
        .I3(Zero_INST_0_i_86_n_0),
        .O(Zero_INST_0_i_23_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    Zero_INST_0_i_24
       (.I0(B[21]),
        .I1(A[21]),
        .I2(B[20]),
        .I3(A[20]),
        .O(Zero_INST_0_i_24_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    Zero_INST_0_i_25
       (.I0(A[23]),
        .I1(B[23]),
        .O(Zero_INST_0_i_25_n_0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    Zero_INST_0_i_26
       (.I0(B[17]),
        .I1(A[17]),
        .I2(B[16]),
        .I3(A[16]),
        .O(Zero_INST_0_i_26_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    Zero_INST_0_i_27
       (.I0(B[19]),
        .I1(A[19]),
        .I2(B[18]),
        .I3(A[18]),
        .O(Zero_INST_0_i_27_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    Zero_INST_0_i_28
       (.I0(B[29]),
        .I1(A[29]),
        .I2(B[28]),
        .I3(A[28]),
        .O(Zero_INST_0_i_28_n_0));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h6)) 
    Zero_INST_0_i_29
       (.I0(A[31]),
        .I1(B[31]),
        .O(Zero_INST_0_i_29_n_0));
  LUT6 #(
    .INIT(64'h888888888888888B)) 
    Zero_INST_0_i_3
       (.I0(Zero_INST_0_i_14_n_0),
        .I1(AluOp[0]),
        .I2(Zero_INST_0_i_15_n_0),
        .I3(Zero_INST_0_i_16_n_0),
        .I4(Zero_INST_0_i_17_n_0),
        .I5(Zero_INST_0_i_18_n_0),
        .O(Zero_INST_0_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    Zero_INST_0_i_30
       (.I0(B[25]),
        .I1(A[25]),
        .I2(B[24]),
        .I3(A[24]),
        .O(Zero_INST_0_i_30_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    Zero_INST_0_i_31
       (.I0(B[27]),
        .I1(A[27]),
        .I2(B[26]),
        .I3(A[26]),
        .O(Zero_INST_0_i_31_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    Zero_INST_0_i_32
       (.I0(B[5]),
        .I1(A[5]),
        .I2(B[4]),
        .I3(A[4]),
        .O(Zero_INST_0_i_32_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    Zero_INST_0_i_33
       (.I0(A[7]),
        .I1(B[7]),
        .O(Zero_INST_0_i_33_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    Zero_INST_0_i_34
       (.I0(B[1]),
        .I1(A[1]),
        .I2(B[0]),
        .I3(A[0]),
        .O(Zero_INST_0_i_34_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    Zero_INST_0_i_35
       (.I0(B[3]),
        .I1(A[3]),
        .I2(B[2]),
        .I3(A[2]),
        .O(Zero_INST_0_i_35_n_0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    Zero_INST_0_i_36
       (.I0(B[13]),
        .I1(A[13]),
        .I2(B[12]),
        .I3(A[12]),
        .O(Zero_INST_0_i_36_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    Zero_INST_0_i_37
       (.I0(A[15]),
        .I1(B[15]),
        .O(Zero_INST_0_i_37_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    Zero_INST_0_i_38
       (.I0(B[9]),
        .I1(A[9]),
        .I2(B[8]),
        .I3(A[8]),
        .O(Zero_INST_0_i_38_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    Zero_INST_0_i_39
       (.I0(B[11]),
        .I1(A[11]),
        .I2(B[10]),
        .I3(A[10]),
        .O(Zero_INST_0_i_39_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    Zero_INST_0_i_40
       (.I0(B[21]),
        .I1(A[21]),
        .I2(B[20]),
        .I3(A[20]),
        .O(Zero_INST_0_i_40_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    Zero_INST_0_i_41
       (.I0(A[18]),
        .I1(B[18]),
        .I2(A[19]),
        .I3(B[19]),
        .I4(Zero_INST_0_i_87_n_0),
        .O(Zero_INST_0_i_41_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    Zero_INST_0_i_42
       (.I0(B[29]),
        .I1(A[29]),
        .I2(B[28]),
        .I3(A[28]),
        .O(Zero_INST_0_i_42_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    Zero_INST_0_i_43
       (.I0(A[26]),
        .I1(B[26]),
        .I2(A[27]),
        .I3(B[27]),
        .I4(Zero_INST_0_i_88_n_0),
        .O(Zero_INST_0_i_43_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    Zero_INST_0_i_44
       (.I0(B[5]),
        .I1(A[5]),
        .I2(B[4]),
        .I3(A[4]),
        .O(Zero_INST_0_i_44_n_0));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    Zero_INST_0_i_45
       (.I0(A[2]),
        .I1(B[2]),
        .I2(A[3]),
        .I3(B[3]),
        .I4(Zero_INST_0_i_89_n_0),
        .O(Zero_INST_0_i_45_n_0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    Zero_INST_0_i_46
       (.I0(B[13]),
        .I1(A[13]),
        .I2(B[12]),
        .I3(A[12]),
        .O(Zero_INST_0_i_46_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    Zero_INST_0_i_47
       (.I0(A[10]),
        .I1(B[10]),
        .I2(A[11]),
        .I3(B[11]),
        .I4(Zero_INST_0_i_90_n_0),
        .O(Zero_INST_0_i_47_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    Zero_INST_0_i_48
       (.I0(Zero_INST_0_i_91_n_0),
        .I1(B[23]),
        .I2(A[23]),
        .I3(B[22]),
        .I4(A[22]),
        .I5(Zero_INST_0_i_92_n_0),
        .O(Zero_INST_0_i_48_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    Zero_INST_0_i_49
       (.I0(Zero_INST_0_i_93_n_0),
        .I1(B[30]),
        .I2(A[30]),
        .I3(B[31]),
        .I4(A[31]),
        .I5(Zero_INST_0_i_94_n_0),
        .O(Zero_INST_0_i_49_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFFE)) 
    Zero_INST_0_i_5
       (.I0(Zero_INST_0_i_24_n_0),
        .I1(Zero_INST_0_i_25_n_0),
        .I2(B[22]),
        .I3(A[22]),
        .I4(Zero_INST_0_i_26_n_0),
        .I5(Zero_INST_0_i_27_n_0),
        .O(Zero_INST_0_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    Zero_INST_0_i_50
       (.I0(Zero_INST_0_i_95_n_0),
        .I1(B[7]),
        .I2(A[7]),
        .I3(B[6]),
        .I4(A[6]),
        .I5(Zero_INST_0_i_96_n_0),
        .O(Zero_INST_0_i_50_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    Zero_INST_0_i_51
       (.I0(Zero_INST_0_i_97_n_0),
        .I1(B[15]),
        .I2(A[15]),
        .I3(B[14]),
        .I4(A[14]),
        .I5(Zero_INST_0_i_98_n_0),
        .O(Zero_INST_0_i_51_n_0));
  LUT6 #(
    .INIT(64'h000000000000FFCA)) 
    Zero_INST_0_i_52
       (.I0(\Result[22]_INST_0_i_4_n_0 ),
        .I1(\Result[20]_INST_0_i_4_n_0 ),
        .I2(A[0]),
        .I3(\Result[21]_INST_0_i_4_n_0 ),
        .I4(\Result[31]_INST_0_i_7_n_0 ),
        .I5(Zero_INST_0_i_99_n_0),
        .O(Zero_INST_0_i_52_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    Zero_INST_0_i_53
       (.I0(\Result[23]_INST_0_i_5_n_0 ),
        .I1(A[0]),
        .I2(\Result[24]_INST_0_i_4_n_0 ),
        .O(Zero_INST_0_i_53_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    Zero_INST_0_i_54
       (.I0(\Result[22]_INST_0_i_4_n_0 ),
        .I1(A[0]),
        .I2(\Result[23]_INST_0_i_5_n_0 ),
        .O(Zero_INST_0_i_54_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    Zero_INST_0_i_55
       (.I0(Zero_INST_0_i_100_n_0),
        .I1(A[31]),
        .I2(A[29]),
        .I3(A[30]),
        .I4(\Result[31]_INST_0_i_6_n_0 ),
        .I5(\Result[31]_INST_0_i_5_n_0 ),
        .O(Zero_INST_0_i_55_n_0));
  LUT6 #(
    .INIT(64'h000000000000FFCA)) 
    Zero_INST_0_i_56
       (.I0(\Result[18]_INST_0_i_4_n_0 ),
        .I1(\Result[16]_INST_0_i_4_n_0 ),
        .I2(A[0]),
        .I3(\Result[17]_INST_0_i_4_n_0 ),
        .I4(\Result[31]_INST_0_i_7_n_0 ),
        .I5(Zero_INST_0_i_99_n_0),
        .O(Zero_INST_0_i_56_n_0));
  LUT6 #(
    .INIT(64'h000000000000FFCA)) 
    Zero_INST_0_i_57
       (.I0(\Result[20]_INST_0_i_4_n_0 ),
        .I1(\Result[18]_INST_0_i_4_n_0 ),
        .I2(A[0]),
        .I3(\Result[19]_INST_0_i_5_n_0 ),
        .I4(\Result[31]_INST_0_i_7_n_0 ),
        .I5(Zero_INST_0_i_99_n_0),
        .O(Zero_INST_0_i_57_n_0));
  LUT6 #(
    .INIT(64'h0101010000000100)) 
    Zero_INST_0_i_58
       (.I0(\Result[31]_INST_0_i_5_n_0 ),
        .I1(\Result[31]_INST_0_i_6_n_0 ),
        .I2(\Result[31]_INST_0_i_7_n_0 ),
        .I3(\Result[30]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[29]_INST_0_i_4_n_0 ),
        .O(Zero_INST_0_i_58_n_0));
  LUT6 #(
    .INIT(64'h0101010000000100)) 
    Zero_INST_0_i_59
       (.I0(\Result[31]_INST_0_i_5_n_0 ),
        .I1(\Result[31]_INST_0_i_6_n_0 ),
        .I2(\Result[31]_INST_0_i_7_n_0 ),
        .I3(\Result[29]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .I5(\Result[28]_INST_0_i_4_n_0 ),
        .O(Zero_INST_0_i_59_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFBE)) 
    Zero_INST_0_i_6
       (.I0(Zero_INST_0_i_28_n_0),
        .I1(B[30]),
        .I2(A[30]),
        .I3(Zero_INST_0_i_29_n_0),
        .I4(Zero_INST_0_i_30_n_0),
        .I5(Zero_INST_0_i_31_n_0),
        .O(Zero_INST_0_i_6_n_0));
  LUT6 #(
    .INIT(64'h0101010000000100)) 
    Zero_INST_0_i_60
       (.I0(\Result[31]_INST_0_i_5_n_0 ),
        .I1(\Result[31]_INST_0_i_6_n_0 ),
        .I2(\Result[31]_INST_0_i_7_n_0 ),
        .I3(\Result[31]_INST_0_i_9_n_0 ),
        .I4(A[0]),
        .I5(\Result[30]_INST_0_i_4_n_0 ),
        .O(Zero_INST_0_i_60_n_0));
  LUT6 #(
    .INIT(64'h000000000000FFCA)) 
    Zero_INST_0_i_61
       (.I0(\Result[26]_INST_0_i_4_n_0 ),
        .I1(\Result[24]_INST_0_i_4_n_0 ),
        .I2(A[0]),
        .I3(\Result[25]_INST_0_i_4_n_0 ),
        .I4(\Result[31]_INST_0_i_7_n_0 ),
        .I5(Zero_INST_0_i_99_n_0),
        .O(Zero_INST_0_i_61_n_0));
  LUT6 #(
    .INIT(64'h000000000000FFCA)) 
    Zero_INST_0_i_62
       (.I0(\Result[28]_INST_0_i_4_n_0 ),
        .I1(\Result[26]_INST_0_i_4_n_0 ),
        .I2(A[0]),
        .I3(\Result[27]_INST_0_i_5_n_0 ),
        .I4(\Result[31]_INST_0_i_7_n_0 ),
        .I5(Zero_INST_0_i_99_n_0),
        .O(Zero_INST_0_i_62_n_0));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    Zero_INST_0_i_63
       (.I0(\Result[5]_INST_0_i_4_n_0 ),
        .I1(A[0]),
        .I2(\Result[6]_INST_0_i_4_n_0 ),
        .O(Zero_INST_0_i_63_n_0));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    Zero_INST_0_i_64
       (.I0(\Result[4]_INST_0_i_4_n_0 ),
        .I1(A[0]),
        .I2(\Result[5]_INST_0_i_4_n_0 ),
        .O(Zero_INST_0_i_64_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    Zero_INST_0_i_65
       (.I0(\Result[7]_INST_0_i_5_n_0 ),
        .I1(\Result[7]_INST_0_i_6_n_0 ),
        .I2(A[0]),
        .I3(Zero_INST_0_i_101_n_0),
        .I4(A[1]),
        .I5(Zero_INST_0_i_102_n_0),
        .O(Zero_INST_0_i_65_n_0));
  LUT5 #(
    .INIT(32'hFF00B8B8)) 
    Zero_INST_0_i_66
       (.I0(\Result[7]_INST_0_i_5_n_0 ),
        .I1(A[1]),
        .I2(\Result[7]_INST_0_i_6_n_0 ),
        .I3(\Result[6]_INST_0_i_4_n_0 ),
        .I4(A[0]),
        .O(Zero_INST_0_i_66_n_0));
  LUT6 #(
    .INIT(64'h000F000F000F000E)) 
    Zero_INST_0_i_67
       (.I0(Zero_INST_0_i_103_n_0),
        .I1(Zero_INST_0_i_104_n_0),
        .I2(Zero_INST_0_i_99_n_0),
        .I3(\Result[31]_INST_0_i_7_n_0 ),
        .I4(Zero_INST_0_i_105_n_0),
        .I5(Zero_INST_0_i_106_n_0),
        .O(Zero_INST_0_i_67_n_0));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    Zero_INST_0_i_68
       (.I0(\Result[13]_INST_0_i_4_n_0 ),
        .I1(A[0]),
        .I2(\Result[14]_INST_0_i_4_n_0 ),
        .O(Zero_INST_0_i_68_n_0));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    Zero_INST_0_i_69
       (.I0(\Result[12]_INST_0_i_4_n_0 ),
        .I1(A[0]),
        .I2(\Result[13]_INST_0_i_4_n_0 ),
        .O(Zero_INST_0_i_69_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFFE)) 
    Zero_INST_0_i_7
       (.I0(Zero_INST_0_i_32_n_0),
        .I1(Zero_INST_0_i_33_n_0),
        .I2(B[6]),
        .I3(A[6]),
        .I4(Zero_INST_0_i_34_n_0),
        .I5(Zero_INST_0_i_35_n_0),
        .O(Zero_INST_0_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    Zero_INST_0_i_70
       (.I0(\Result[15]_INST_0_i_5_n_0 ),
        .I1(A[0]),
        .I2(\Result[16]_INST_0_i_4_n_0 ),
        .O(Zero_INST_0_i_70_n_0));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    Zero_INST_0_i_71
       (.I0(\Result[14]_INST_0_i_4_n_0 ),
        .I1(A[0]),
        .I2(\Result[15]_INST_0_i_5_n_0 ),
        .O(Zero_INST_0_i_71_n_0));
  LUT6 #(
    .INIT(64'h000F000F000F000E)) 
    Zero_INST_0_i_72
       (.I0(Zero_INST_0_i_107_n_0),
        .I1(Zero_INST_0_i_108_n_0),
        .I2(Zero_INST_0_i_99_n_0),
        .I3(\Result[31]_INST_0_i_7_n_0 ),
        .I4(Zero_INST_0_i_109_n_0),
        .I5(Zero_INST_0_i_110_n_0),
        .O(Zero_INST_0_i_72_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_79
       (.I0(\Result[27]_INST_0_i_3_n_6 ),
        .I1(\Result[27]_INST_0_i_3_n_7 ),
        .I2(\Result[27]_INST_0_i_3_n_4 ),
        .I3(\Result[27]_INST_0_i_3_n_5 ),
        .O(Zero_INST_0_i_79_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFFE)) 
    Zero_INST_0_i_8
       (.I0(Zero_INST_0_i_36_n_0),
        .I1(Zero_INST_0_i_37_n_0),
        .I2(B[14]),
        .I3(A[14]),
        .I4(Zero_INST_0_i_38_n_0),
        .I5(Zero_INST_0_i_39_n_0),
        .O(Zero_INST_0_i_8_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    Zero_INST_0_i_80
       (.I0(\Result[31]_INST_0_i_4_n_5 ),
        .I1(data0),
        .I2(\Result[31]_INST_0_i_4_n_6 ),
        .I3(\Result[31]_INST_0_i_4_n_7 ),
        .O(Zero_INST_0_i_80_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    Zero_INST_0_i_81
       (.I0(\Result[23]_INST_0_i_4_n_4 ),
        .I1(\Result[23]_INST_0_i_4_n_5 ),
        .I2(\Result[23]_INST_0_i_4_n_6 ),
        .I3(\Result[23]_INST_0_i_4_n_7 ),
        .O(Zero_INST_0_i_81_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    Zero_INST_0_i_82
       (.I0(\Result[19]_INST_0_i_3_n_4 ),
        .I1(\Result[19]_INST_0_i_3_n_5 ),
        .I2(\Result[19]_INST_0_i_3_n_6 ),
        .I3(\Result[19]_INST_0_i_3_n_7 ),
        .O(Zero_INST_0_i_82_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_83
       (.I0(\Result[3]_INST_0_i_3_n_6 ),
        .I1(\Result[3]_INST_0_i_3_n_7 ),
        .I2(\Result[3]_INST_0_i_3_n_4 ),
        .I3(\Result[3]_INST_0_i_3_n_5 ),
        .O(Zero_INST_0_i_83_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    Zero_INST_0_i_84
       (.I0(\Result[7]_INST_0_i_4_n_4 ),
        .I1(\Result[7]_INST_0_i_4_n_5 ),
        .I2(\Result[7]_INST_0_i_4_n_6 ),
        .I3(\Result[7]_INST_0_i_4_n_7 ),
        .O(Zero_INST_0_i_84_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_85
       (.I0(\Result[11]_INST_0_i_3_n_6 ),
        .I1(\Result[11]_INST_0_i_3_n_7 ),
        .I2(\Result[11]_INST_0_i_3_n_4 ),
        .I3(\Result[11]_INST_0_i_3_n_5 ),
        .O(Zero_INST_0_i_85_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    Zero_INST_0_i_86
       (.I0(\Result[15]_INST_0_i_4_n_4 ),
        .I1(\Result[15]_INST_0_i_4_n_5 ),
        .I2(\Result[15]_INST_0_i_4_n_6 ),
        .I3(\Result[15]_INST_0_i_4_n_7 ),
        .O(Zero_INST_0_i_86_n_0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    Zero_INST_0_i_87
       (.I0(B[17]),
        .I1(A[17]),
        .I2(B[16]),
        .I3(A[16]),
        .O(Zero_INST_0_i_87_n_0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    Zero_INST_0_i_88
       (.I0(B[25]),
        .I1(A[25]),
        .I2(B[24]),
        .I3(A[24]),
        .O(Zero_INST_0_i_88_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    Zero_INST_0_i_89
       (.I0(B[1]),
        .I1(A[1]),
        .I2(B[0]),
        .I3(A[0]),
        .O(Zero_INST_0_i_89_n_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    Zero_INST_0_i_90
       (.I0(B[9]),
        .I1(A[9]),
        .I2(B[8]),
        .I3(A[8]),
        .O(Zero_INST_0_i_90_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_91
       (.I0(B[21]),
        .I1(A[21]),
        .I2(B[20]),
        .I3(A[20]),
        .O(Zero_INST_0_i_91_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    Zero_INST_0_i_92
       (.I0(A[18]),
        .I1(B[18]),
        .I2(A[19]),
        .I3(B[19]),
        .I4(Zero_INST_0_i_111_n_0),
        .O(Zero_INST_0_i_92_n_0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_93
       (.I0(B[29]),
        .I1(A[29]),
        .I2(B[28]),
        .I3(A[28]),
        .O(Zero_INST_0_i_93_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    Zero_INST_0_i_94
       (.I0(A[26]),
        .I1(B[26]),
        .I2(A[27]),
        .I3(B[27]),
        .I4(Zero_INST_0_i_112_n_0),
        .O(Zero_INST_0_i_94_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_95
       (.I0(B[5]),
        .I1(A[5]),
        .I2(B[4]),
        .I3(A[4]),
        .O(Zero_INST_0_i_95_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    Zero_INST_0_i_96
       (.I0(A[2]),
        .I1(B[2]),
        .I2(A[3]),
        .I3(B[3]),
        .I4(Zero_INST_0_i_113_n_0),
        .O(Zero_INST_0_i_96_n_0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_97
       (.I0(B[13]),
        .I1(A[13]),
        .I2(B[12]),
        .I3(A[12]),
        .O(Zero_INST_0_i_97_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    Zero_INST_0_i_98
       (.I0(A[10]),
        .I1(B[10]),
        .I2(A[11]),
        .I3(B[11]),
        .I4(Zero_INST_0_i_114_n_0),
        .O(Zero_INST_0_i_98_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zero_INST_0_i_99
       (.I0(\Result[31]_INST_0_i_14_n_0 ),
        .I1(Zero_INST_0_i_115_n_0),
        .I2(\Result[31]_INST_0_i_15_n_0 ),
        .I3(Zero_INST_0_i_116_n_0),
        .O(Zero_INST_0_i_99_n_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ALU inst
       (.A(A),
        .\A[14]_0 (\Result[1]_INST_0_i_2_n_0 ),
        .\A[14]_1 (\Result[2]_INST_0_i_2_n_0 ),
        .\A[14]_10 (\Result[11]_INST_0_i_2_n_0 ),
        .\A[14]_11 (\Result[12]_INST_0_i_3_n_0 ),
        .\A[14]_12 (\Result[13]_INST_0_i_3_n_0 ),
        .\A[14]_13 (\Result[14]_INST_0_i_3_n_0 ),
        .\A[14]_14 (\Result[15]_INST_0_i_3_n_0 ),
        .\A[14]_15 (\Result[16]_INST_0_i_2_n_0 ),
        .\A[14]_16 (\Result[17]_INST_0_i_2_n_0 ),
        .\A[14]_17 (\Result[18]_INST_0_i_2_n_0 ),
        .\A[14]_18 (\Result[19]_INST_0_i_2_n_0 ),
        .\A[14]_19 (\Result[20]_INST_0_i_2_n_0 ),
        .\A[14]_2 (\Result[3]_INST_0_i_2_n_0 ),
        .\A[14]_20 (\Result[21]_INST_0_i_2_n_0 ),
        .\A[14]_21 (\Result[22]_INST_0_i_3_n_0 ),
        .\A[14]_22 (\Result[23]_INST_0_i_3_n_0 ),
        .\A[14]_23 (\Result[24]_INST_0_i_2_n_0 ),
        .\A[14]_24 (\Result[25]_INST_0_i_2_n_0 ),
        .\A[14]_25 (\Result[26]_INST_0_i_2_n_0 ),
        .\A[14]_26 (\Result[27]_INST_0_i_2_n_0 ),
        .\A[14]_27 (\Result[28]_INST_0_i_2_n_0 ),
        .\A[14]_28 (\Result[29]_INST_0_i_2_n_0 ),
        .\A[14]_29 (\Result[30]_INST_0_i_2_n_0 ),
        .\A[14]_3 (\Result[4]_INST_0_i_3_n_0 ),
        .\A[14]_4 (\Result[5]_INST_0_i_3_n_0 ),
        .\A[14]_5 (\Result[6]_INST_0_i_3_n_0 ),
        .\A[14]_6 (\Result[7]_INST_0_i_3_n_0 ),
        .\A[14]_7 (\Result[8]_INST_0_i_2_n_0 ),
        .\A[14]_8 (\Result[9]_INST_0_i_2_n_0 ),
        .\A[14]_9 (\Result[10]_INST_0_i_2_n_0 ),
        .A_0__s_port_(Zero_INST_0_i_12_n_0),
        .A_10__s_port_(Zero_INST_0_i_8_n_0),
        .A_14__s_port_(\Result[0]_INST_0_i_3_n_0 ),
        .A_16__s_port_(Zero_INST_0_i_10_n_0),
        .A_18__s_port_(Zero_INST_0_i_5_n_0),
        .A_24__s_port_(Zero_INST_0_i_11_n_0),
        .A_26__s_port_(Zero_INST_0_i_6_n_0),
        .A_2__s_port_(Zero_INST_0_i_7_n_0),
        .A_4__s_port_(Zero_INST_0_i_3_n_0),
        .A_8__s_port_(Zero_INST_0_i_13_n_0),
        .AluOp(AluOp),
        .B(B),
        .\B[0] ({\Result[3]_INST_0_i_3_n_4 ,\Result[3]_INST_0_i_3_n_5 ,\Result[3]_INST_0_i_3_n_6 ,\Result[3]_INST_0_i_3_n_7 }),
        .\B[0]_0 ({\Result[7]_INST_0_i_4_n_4 ,\Result[7]_INST_0_i_4_n_5 ,\Result[7]_INST_0_i_4_n_6 ,\Result[7]_INST_0_i_4_n_7 }),
        .\B[0]_1 ({\Result[11]_INST_0_i_3_n_4 ,\Result[11]_INST_0_i_3_n_5 ,\Result[11]_INST_0_i_3_n_6 ,\Result[11]_INST_0_i_3_n_7 }),
        .\B[0]_2 ({\Result[15]_INST_0_i_4_n_4 ,\Result[15]_INST_0_i_4_n_5 ,\Result[15]_INST_0_i_4_n_6 ,\Result[15]_INST_0_i_4_n_7 }),
        .\B[0]_3 ({\Result[19]_INST_0_i_3_n_4 ,\Result[19]_INST_0_i_3_n_5 ,\Result[19]_INST_0_i_3_n_6 ,\Result[19]_INST_0_i_3_n_7 }),
        .\B[0]_4 ({\Result[23]_INST_0_i_4_n_4 ,\Result[23]_INST_0_i_4_n_5 ,\Result[23]_INST_0_i_4_n_6 ,\Result[23]_INST_0_i_4_n_7 }),
        .\B[0]_5 ({\Result[27]_INST_0_i_3_n_4 ,\Result[27]_INST_0_i_3_n_5 ,\Result[27]_INST_0_i_3_n_6 ,\Result[27]_INST_0_i_3_n_7 }),
        .\B[0]_6 (Zero_INST_0_i_22_n_0),
        .\B[12]_0 (Zero_INST_0_i_23_n_0),
        .B_12__s_port_(\Result[12]_INST_0_i_2_n_0 ),
        .B_13__s_port_(\Result[13]_INST_0_i_2_n_0 ),
        .B_14__s_port_(\Result[14]_INST_0_i_2_n_0 ),
        .B_15__s_port_(\Result[15]_INST_0_i_2_n_0 ),
        .B_22__s_port_(\Result[22]_INST_0_i_2_n_0 ),
        .B_23__s_port_(\Result[23]_INST_0_i_2_n_0 ),
        .B_4__s_port_(\Result[4]_INST_0_i_2_n_0 ),
        .B_5__s_port_(\Result[5]_INST_0_i_2_n_0 ),
        .B_6__s_port_(\Result[6]_INST_0_i_2_n_0 ),
        .B_7__s_port_(\Result[7]_INST_0_i_2_n_0 ),
        .O({data0,\Result[31]_INST_0_i_4_n_5 ,\Result[31]_INST_0_i_4_n_6 ,\Result[31]_INST_0_i_4_n_7 }),
        .Result({Sign,\^Result }),
        .Zero(Zero),
        .data2(data2),
        .p_4_in(p_4_in));
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
