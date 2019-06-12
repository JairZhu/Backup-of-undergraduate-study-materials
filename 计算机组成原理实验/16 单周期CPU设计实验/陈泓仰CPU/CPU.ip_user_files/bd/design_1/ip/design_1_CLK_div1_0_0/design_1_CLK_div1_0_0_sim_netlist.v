// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Fri Nov 17 22:19:51 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_CLK_div1_0_0/design_1_CLK_div1_0_0_sim_netlist.v
// Design      : design_1_CLK_div1_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_CLK_div1_0_0,CLK_div1,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "CLK_div1,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module design_1_CLK_div1_0_0
   (CLK,
    clr,
    CLK_div);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) input CLK;
  input clr;
  output CLK_div;

  wire CLK;
  wire CLK_div;
  wire clr;

  design_1_CLK_div1_0_0_CLK_div1 inst
       (.CLK(CLK),
        .CLK_div(CLK_div),
        .clr(clr));
endmodule

(* ORIG_REF_NAME = "CLK_div1" *) 
module design_1_CLK_div1_0_0_CLK_div1
   (CLK_div,
    clr,
    CLK);
  output CLK_div;
  input clr;
  input CLK;

  wire CLK;
  wire CLK_div;
  wire CLK_div1_i_10_n_0;
  wire CLK_div1_i_11_n_0;
  wire CLK_div1_i_1_n_0;
  wire CLK_div1_i_2_n_0;
  wire CLK_div1_i_3_n_0;
  wire CLK_div1_i_4_n_0;
  wire CLK_div1_i_5_n_0;
  wire CLK_div1_i_6_n_0;
  wire CLK_div1_i_7_n_0;
  wire CLK_div1_i_8_n_0;
  wire CLK_div1_i_9_n_0;
  wire clr;
  wire [40:1]p_1_in;
  wire [40:0]q;
  wire [40:1]q0;
  wire q0_carry__0_n_0;
  wire q0_carry__0_n_1;
  wire q0_carry__0_n_2;
  wire q0_carry__0_n_3;
  wire q0_carry__1_n_0;
  wire q0_carry__1_n_1;
  wire q0_carry__1_n_2;
  wire q0_carry__1_n_3;
  wire q0_carry__2_n_0;
  wire q0_carry__2_n_1;
  wire q0_carry__2_n_2;
  wire q0_carry__2_n_3;
  wire q0_carry__3_n_0;
  wire q0_carry__3_n_1;
  wire q0_carry__3_n_2;
  wire q0_carry__3_n_3;
  wire q0_carry__4_n_0;
  wire q0_carry__4_n_1;
  wire q0_carry__4_n_2;
  wire q0_carry__4_n_3;
  wire q0_carry__5_n_0;
  wire q0_carry__5_n_1;
  wire q0_carry__5_n_2;
  wire q0_carry__5_n_3;
  wire q0_carry__6_n_0;
  wire q0_carry__6_n_1;
  wire q0_carry__6_n_2;
  wire q0_carry__6_n_3;
  wire q0_carry__7_n_0;
  wire q0_carry__7_n_1;
  wire q0_carry__7_n_2;
  wire q0_carry__7_n_3;
  wire q0_carry__8_n_1;
  wire q0_carry__8_n_2;
  wire q0_carry__8_n_3;
  wire q0_carry_i_1__0_n_0;
  wire q0_carry_i_1__1_n_0;
  wire q0_carry_i_1__2_n_0;
  wire q0_carry_i_1__3_n_0;
  wire q0_carry_i_1__4_n_0;
  wire q0_carry_i_1__5_n_0;
  wire q0_carry_i_1__6_n_0;
  wire q0_carry_i_1__7_n_0;
  wire q0_carry_i_1__8_n_0;
  wire q0_carry_i_1_n_0;
  wire q0_carry_i_2__0_n_0;
  wire q0_carry_i_2__1_n_0;
  wire q0_carry_i_2__2_n_0;
  wire q0_carry_i_2__3_n_0;
  wire q0_carry_i_2__4_n_0;
  wire q0_carry_i_2__5_n_0;
  wire q0_carry_i_2__6_n_0;
  wire q0_carry_i_2__7_n_0;
  wire q0_carry_i_2__8_n_0;
  wire q0_carry_i_2_n_0;
  wire q0_carry_i_3__0_n_0;
  wire q0_carry_i_3__1_n_0;
  wire q0_carry_i_3__2_n_0;
  wire q0_carry_i_3__3_n_0;
  wire q0_carry_i_3__4_n_0;
  wire q0_carry_i_3__5_n_0;
  wire q0_carry_i_3__6_n_0;
  wire q0_carry_i_3__7_n_0;
  wire q0_carry_i_3__8_n_0;
  wire q0_carry_i_3_n_0;
  wire q0_carry_i_4__0_n_0;
  wire q0_carry_i_4__1_n_0;
  wire q0_carry_i_4__2_n_0;
  wire q0_carry_i_4__3_n_0;
  wire q0_carry_i_4__4_n_0;
  wire q0_carry_i_4__5_n_0;
  wire q0_carry_i_4__6_n_0;
  wire q0_carry_i_4__7_n_0;
  wire q0_carry_i_4__8_n_0;
  wire q0_carry_i_4_n_0;
  wire q0_carry_n_0;
  wire q0_carry_n_1;
  wire q0_carry_n_2;
  wire q0_carry_n_3;
  wire \q[0]_i_1_n_0 ;
  wire \q[40]_i_1_n_0 ;
  wire [3:3]NLW_q0_carry__8_CO_UNCONNECTED;

  LUT6 #(
    .INIT(64'hEAAAAAAA15555555)) 
    CLK_div1_i_1
       (.I0(clr),
        .I1(CLK_div1_i_2_n_0),
        .I2(CLK_div1_i_3_n_0),
        .I3(CLK_div1_i_4_n_0),
        .I4(CLK_div1_i_5_n_0),
        .I5(CLK_div),
        .O(CLK_div1_i_1_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    CLK_div1_i_10
       (.I0(q[5]),
        .I1(q[6]),
        .I2(q[4]),
        .O(CLK_div1_i_10_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    CLK_div1_i_11
       (.I0(q[10]),
        .I1(q[11]),
        .I2(q[13]),
        .I3(q[8]),
        .I4(q[9]),
        .O(CLK_div1_i_11_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    CLK_div1_i_2
       (.I0(q[23]),
        .I1(q[21]),
        .I2(q[22]),
        .I3(q[18]),
        .I4(q[19]),
        .I5(q[20]),
        .O(CLK_div1_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    CLK_div1_i_3
       (.I0(q[29]),
        .I1(q[27]),
        .I2(q[28]),
        .I3(q[24]),
        .I4(q[25]),
        .I5(q[26]),
        .O(CLK_div1_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    CLK_div1_i_4
       (.I0(q[38]),
        .I1(q[37]),
        .I2(q[36]),
        .I3(q[40]),
        .I4(q[39]),
        .I5(CLK_div1_i_6_n_0),
        .O(CLK_div1_i_4_n_0));
  LUT5 #(
    .INIT(32'hBBFBBBBB)) 
    CLK_div1_i_5
       (.I0(CLK_div1_i_7_n_0),
        .I1(CLK_div1_i_8_n_0),
        .I2(CLK_div1_i_9_n_0),
        .I3(CLK_div1_i_10_n_0),
        .I4(CLK_div1_i_11_n_0),
        .O(CLK_div1_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    CLK_div1_i_6
       (.I0(q[32]),
        .I1(q[30]),
        .I2(q[31]),
        .I3(q[35]),
        .I4(q[33]),
        .I5(q[34]),
        .O(CLK_div1_i_6_n_0));
  LUT6 #(
    .INIT(64'h7F7F7FFFFFFFFFFF)) 
    CLK_div1_i_7
       (.I0(q[14]),
        .I1(q[15]),
        .I2(q[17]),
        .I3(q[12]),
        .I4(q[13]),
        .I5(q[16]),
        .O(CLK_div1_i_7_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    CLK_div1_i_8
       (.I0(q[8]),
        .I1(q[13]),
        .I2(q[7]),
        .I3(q[10]),
        .I4(q[9]),
        .I5(q[11]),
        .O(CLK_div1_i_8_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    CLK_div1_i_9
       (.I0(q[1]),
        .I1(q[0]),
        .I2(q[2]),
        .I3(q[3]),
        .O(CLK_div1_i_9_n_0));
  FDRE CLK_div1_reg
       (.C(CLK),
        .CE(1'b1),
        .D(CLK_div1_i_1_n_0),
        .Q(CLK_div),
        .R(1'b0));
  CARRY4 q0_carry
       (.CI(1'b0),
        .CO({q0_carry_n_0,q0_carry_n_1,q0_carry_n_2,q0_carry_n_3}),
        .CYINIT(q[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(q0[4:1]),
        .S({q0_carry_i_1_n_0,q0_carry_i_2_n_0,q0_carry_i_3_n_0,q0_carry_i_4_n_0}));
  CARRY4 q0_carry__0
       (.CI(q0_carry_n_0),
        .CO({q0_carry__0_n_0,q0_carry__0_n_1,q0_carry__0_n_2,q0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(q0[8:5]),
        .S({q0_carry_i_1__0_n_0,q0_carry_i_2__0_n_0,q0_carry_i_3__0_n_0,q0_carry_i_4__0_n_0}));
  CARRY4 q0_carry__1
       (.CI(q0_carry__0_n_0),
        .CO({q0_carry__1_n_0,q0_carry__1_n_1,q0_carry__1_n_2,q0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(q0[12:9]),
        .S({q0_carry_i_1__1_n_0,q0_carry_i_2__1_n_0,q0_carry_i_3__1_n_0,q0_carry_i_4__1_n_0}));
  CARRY4 q0_carry__2
       (.CI(q0_carry__1_n_0),
        .CO({q0_carry__2_n_0,q0_carry__2_n_1,q0_carry__2_n_2,q0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(q0[16:13]),
        .S({q0_carry_i_1__2_n_0,q0_carry_i_2__2_n_0,q0_carry_i_3__2_n_0,q0_carry_i_4__2_n_0}));
  CARRY4 q0_carry__3
       (.CI(q0_carry__2_n_0),
        .CO({q0_carry__3_n_0,q0_carry__3_n_1,q0_carry__3_n_2,q0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(q0[20:17]),
        .S({q0_carry_i_1__3_n_0,q0_carry_i_2__3_n_0,q0_carry_i_3__3_n_0,q0_carry_i_4__3_n_0}));
  CARRY4 q0_carry__4
       (.CI(q0_carry__3_n_0),
        .CO({q0_carry__4_n_0,q0_carry__4_n_1,q0_carry__4_n_2,q0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(q0[24:21]),
        .S({q0_carry_i_1__4_n_0,q0_carry_i_2__4_n_0,q0_carry_i_3__4_n_0,q0_carry_i_4__4_n_0}));
  CARRY4 q0_carry__5
       (.CI(q0_carry__4_n_0),
        .CO({q0_carry__5_n_0,q0_carry__5_n_1,q0_carry__5_n_2,q0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(q0[28:25]),
        .S({q0_carry_i_1__5_n_0,q0_carry_i_2__5_n_0,q0_carry_i_3__5_n_0,q0_carry_i_4__5_n_0}));
  CARRY4 q0_carry__6
       (.CI(q0_carry__5_n_0),
        .CO({q0_carry__6_n_0,q0_carry__6_n_1,q0_carry__6_n_2,q0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(q0[32:29]),
        .S({q0_carry_i_1__6_n_0,q0_carry_i_2__6_n_0,q0_carry_i_3__6_n_0,q0_carry_i_4__6_n_0}));
  CARRY4 q0_carry__7
       (.CI(q0_carry__6_n_0),
        .CO({q0_carry__7_n_0,q0_carry__7_n_1,q0_carry__7_n_2,q0_carry__7_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(q0[36:33]),
        .S({q0_carry_i_1__7_n_0,q0_carry_i_2__7_n_0,q0_carry_i_3__7_n_0,q0_carry_i_4__7_n_0}));
  CARRY4 q0_carry__8
       (.CI(q0_carry__7_n_0),
        .CO({NLW_q0_carry__8_CO_UNCONNECTED[3],q0_carry__8_n_1,q0_carry__8_n_2,q0_carry__8_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(q0[40:37]),
        .S({q0_carry_i_1__8_n_0,q0_carry_i_2__8_n_0,q0_carry_i_3__8_n_0,q0_carry_i_4__8_n_0}));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_1
       (.I0(q[4]),
        .O(q0_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_1__0
       (.I0(q[8]),
        .O(q0_carry_i_1__0_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_1__1
       (.I0(q[12]),
        .O(q0_carry_i_1__1_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_1__2
       (.I0(q[16]),
        .O(q0_carry_i_1__2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_1__3
       (.I0(q[20]),
        .O(q0_carry_i_1__3_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_1__4
       (.I0(q[24]),
        .O(q0_carry_i_1__4_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_1__5
       (.I0(q[28]),
        .O(q0_carry_i_1__5_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_1__6
       (.I0(q[32]),
        .O(q0_carry_i_1__6_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_1__7
       (.I0(q[36]),
        .O(q0_carry_i_1__7_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_1__8
       (.I0(q[40]),
        .O(q0_carry_i_1__8_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_2
       (.I0(q[3]),
        .O(q0_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_2__0
       (.I0(q[7]),
        .O(q0_carry_i_2__0_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_2__1
       (.I0(q[11]),
        .O(q0_carry_i_2__1_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_2__2
       (.I0(q[15]),
        .O(q0_carry_i_2__2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_2__3
       (.I0(q[19]),
        .O(q0_carry_i_2__3_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_2__4
       (.I0(q[23]),
        .O(q0_carry_i_2__4_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_2__5
       (.I0(q[27]),
        .O(q0_carry_i_2__5_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_2__6
       (.I0(q[31]),
        .O(q0_carry_i_2__6_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_2__7
       (.I0(q[35]),
        .O(q0_carry_i_2__7_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_2__8
       (.I0(q[39]),
        .O(q0_carry_i_2__8_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_3
       (.I0(q[2]),
        .O(q0_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_3__0
       (.I0(q[6]),
        .O(q0_carry_i_3__0_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_3__1
       (.I0(q[10]),
        .O(q0_carry_i_3__1_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_3__2
       (.I0(q[14]),
        .O(q0_carry_i_3__2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_3__3
       (.I0(q[18]),
        .O(q0_carry_i_3__3_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_3__4
       (.I0(q[22]),
        .O(q0_carry_i_3__4_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_3__5
       (.I0(q[26]),
        .O(q0_carry_i_3__5_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_3__6
       (.I0(q[30]),
        .O(q0_carry_i_3__6_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_3__7
       (.I0(q[34]),
        .O(q0_carry_i_3__7_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_3__8
       (.I0(q[38]),
        .O(q0_carry_i_3__8_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_4
       (.I0(q[1]),
        .O(q0_carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_4__0
       (.I0(q[5]),
        .O(q0_carry_i_4__0_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_4__1
       (.I0(q[9]),
        .O(q0_carry_i_4__1_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_4__2
       (.I0(q[13]),
        .O(q0_carry_i_4__2_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_4__3
       (.I0(q[17]),
        .O(q0_carry_i_4__3_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_4__4
       (.I0(q[21]),
        .O(q0_carry_i_4__4_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_4__5
       (.I0(q[25]),
        .O(q0_carry_i_4__5_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_4__6
       (.I0(q[29]),
        .O(q0_carry_i_4__6_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_4__7
       (.I0(q[33]),
        .O(q0_carry_i_4__7_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    q0_carry_i_4__8
       (.I0(q[37]),
        .O(q0_carry_i_4__8_n_0));
  LUT5 #(
    .INIT(32'h40000000)) 
    \q[0]_i_1 
       (.I0(q[0]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(\q[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[10]_i_1 
       (.I0(q0[10]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[10]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[11]_i_1 
       (.I0(q0[11]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[11]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[12]_i_1 
       (.I0(q0[12]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[12]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[13]_i_1 
       (.I0(q0[13]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[13]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[14]_i_1 
       (.I0(q0[14]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[14]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[15]_i_1 
       (.I0(q0[15]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[15]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[16]_i_1 
       (.I0(q0[16]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[16]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[17]_i_1 
       (.I0(q0[17]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[17]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[18]_i_1 
       (.I0(q0[18]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[18]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[19]_i_1 
       (.I0(q0[19]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[19]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[1]_i_1 
       (.I0(q0[1]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[1]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[20]_i_1 
       (.I0(q0[20]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[20]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[21]_i_1 
       (.I0(q0[21]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[21]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[22]_i_1 
       (.I0(q0[22]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[22]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[23]_i_1 
       (.I0(q0[23]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[23]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[24]_i_1 
       (.I0(q0[24]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[24]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[25]_i_1 
       (.I0(q0[25]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[25]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[26]_i_1 
       (.I0(q0[26]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[26]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[27]_i_1 
       (.I0(q0[27]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[27]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[28]_i_1 
       (.I0(q0[28]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[28]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[29]_i_1 
       (.I0(q0[29]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[29]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[2]_i_1 
       (.I0(q0[2]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[2]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[30]_i_1 
       (.I0(q0[30]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[30]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[31]_i_1 
       (.I0(q0[31]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[31]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[32]_i_1 
       (.I0(q0[32]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[32]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[33]_i_1 
       (.I0(q0[33]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[33]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[34]_i_1 
       (.I0(q0[34]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[34]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[35]_i_1 
       (.I0(q0[35]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[35]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[36]_i_1 
       (.I0(q0[36]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[36]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[37]_i_1 
       (.I0(q0[37]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[37]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[38]_i_1 
       (.I0(q0[38]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[38]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[39]_i_1 
       (.I0(q0[39]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[39]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[3]_i_1 
       (.I0(q0[3]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[3]));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \q[40]_i_1 
       (.I0(CLK_div1_i_5_n_0),
        .I1(CLK_div1_i_4_n_0),
        .I2(CLK_div1_i_3_n_0),
        .I3(CLK_div1_i_2_n_0),
        .I4(clr),
        .O(\q[40]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[40]_i_2 
       (.I0(q0[40]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[40]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[4]_i_1 
       (.I0(q0[4]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[4]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[5]_i_1 
       (.I0(q0[5]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[5]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[6]_i_1 
       (.I0(q0[6]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[6]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[7]_i_1 
       (.I0(q0[7]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[7]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[8]_i_1 
       (.I0(q0[8]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[8]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \q[9]_i_1 
       (.I0(q0[9]),
        .I1(CLK_div1_i_5_n_0),
        .I2(CLK_div1_i_4_n_0),
        .I3(CLK_div1_i_3_n_0),
        .I4(CLK_div1_i_2_n_0),
        .O(p_1_in[9]));
  FDCE \q_reg[0] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(\q[0]_i_1_n_0 ),
        .Q(q[0]));
  FDCE \q_reg[10] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[10]),
        .Q(q[10]));
  FDCE \q_reg[11] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[11]),
        .Q(q[11]));
  FDCE \q_reg[12] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[12]),
        .Q(q[12]));
  FDCE \q_reg[13] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[13]),
        .Q(q[13]));
  FDCE \q_reg[14] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[14]),
        .Q(q[14]));
  FDCE \q_reg[15] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[15]),
        .Q(q[15]));
  FDCE \q_reg[16] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[16]),
        .Q(q[16]));
  FDCE \q_reg[17] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[17]),
        .Q(q[17]));
  FDCE \q_reg[18] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[18]),
        .Q(q[18]));
  FDCE \q_reg[19] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[19]),
        .Q(q[19]));
  FDCE \q_reg[1] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[1]),
        .Q(q[1]));
  FDCE \q_reg[20] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[20]),
        .Q(q[20]));
  FDCE \q_reg[21] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[21]),
        .Q(q[21]));
  FDCE \q_reg[22] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[22]),
        .Q(q[22]));
  FDCE \q_reg[23] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[23]),
        .Q(q[23]));
  FDCE \q_reg[24] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[24]),
        .Q(q[24]));
  FDCE \q_reg[25] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[25]),
        .Q(q[25]));
  FDCE \q_reg[26] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[26]),
        .Q(q[26]));
  FDCE \q_reg[27] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[27]),
        .Q(q[27]));
  FDCE \q_reg[28] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[28]),
        .Q(q[28]));
  FDCE \q_reg[29] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[29]),
        .Q(q[29]));
  FDCE \q_reg[2] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[2]),
        .Q(q[2]));
  FDCE \q_reg[30] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[30]),
        .Q(q[30]));
  FDCE \q_reg[31] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[31]),
        .Q(q[31]));
  FDCE \q_reg[32] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[32]),
        .Q(q[32]));
  FDCE \q_reg[33] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[33]),
        .Q(q[33]));
  FDCE \q_reg[34] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[34]),
        .Q(q[34]));
  FDCE \q_reg[35] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[35]),
        .Q(q[35]));
  FDCE \q_reg[36] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[36]),
        .Q(q[36]));
  FDCE \q_reg[37] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[37]),
        .Q(q[37]));
  FDCE \q_reg[38] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[38]),
        .Q(q[38]));
  FDCE \q_reg[39] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[39]),
        .Q(q[39]));
  FDCE \q_reg[3] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[3]),
        .Q(q[3]));
  FDCE \q_reg[40] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[40]),
        .Q(q[40]));
  FDCE \q_reg[4] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[4]),
        .Q(q[4]));
  FDCE \q_reg[5] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[5]),
        .Q(q[5]));
  FDCE \q_reg[6] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[6]),
        .Q(q[6]));
  FDCE \q_reg[7] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[7]),
        .Q(q[7]));
  FDCE \q_reg[8] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[8]),
        .Q(q[8]));
  FDCE \q_reg[9] 
       (.C(CLK),
        .CE(\q[40]_i_1_n_0 ),
        .CLR(clr),
        .D(p_1_in[9]),
        .Q(q[9]));
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
