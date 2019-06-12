// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
// Date        : Sun Oct 12 01:58:03 2014
// Host        : xshxup31 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               C:/xilinx_workspace/bluetooth_uart/bluetooth_uart.srcs/sources_1/ip/UART_0/UART_0_funcsim.v
// Design      : UART_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* X_CORE_INFO = "uart_top,Vivado 2014.2" *) (* CHECK_LICENSE_TYPE = "UART_0,uart_top,{}" *) (* CORE_GENERATION_INFO = "UART_0,uart_top,{x_ipProduct=Vivado 2014.2,x_ipVendor=xilinx.com,x_ipLibrary=XUP,x_ipName=UART,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG,DVSR=651,DATA_WIDTH=8,SB_TICK=16}" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) 
(* NotValidForBitStream *)
module UART_0
   (clk,
    reset,
    rx,
    tx_btn,
    data_in,
    data_out,
    rx_done,
    tx_done,
    tx);
  input clk;
  input reset;
  input rx;
  input tx_btn;
  input [7:0]data_in;
  output [7:0]data_out;
  output rx_done;
  output tx_done;
  output tx;

  wire clk;
  wire [7:0]data_in;
  wire [7:0]data_out;
  wire reset;
  wire rx;
  wire rx_done;
  wire tx;
  wire tx_btn;
  wire tx_done;

UART_0_uart_top inst
       (.O1(rx_done),
        .clk(clk),
        .data_in(data_in),
        .data_out(data_out),
        .reset(reset),
        .rx(rx),
        .tx(tx),
        .tx_btn(tx_btn),
        .tx_done(tx_done));
endmodule

(* ORIG_REF_NAME = "clk" *) 
module UART_0_clk
   (s_tick,
    clk,
    reset);
  output s_tick;
  input clk;
  input reset;

  wire clk;
  wire [12:0]count_reg;
  wire \n_0_count[0]_i_2 ;
  wire \n_0_count[0]_i_3 ;
  wire \n_0_count[0]_i_4 ;
  wire \n_0_count[0]_i_5 ;
  wire \n_0_count[0]_i_6 ;
  wire \n_0_count[4]_i_2 ;
  wire \n_0_count[4]_i_3 ;
  wire \n_0_count[4]_i_4 ;
  wire \n_0_count[4]_i_5 ;
  wire \n_0_count[8]_i_2 ;
  wire \n_0_count[8]_i_3 ;
  wire \n_0_count_reg[0]_i_1 ;
  wire \n_0_count_reg[4]_i_1 ;
  wire \n_0_count_reg[8]_i_1 ;
  wire n_0_tick_i_2;
  wire n_0_tick_i_3;
  wire n_0_tick_i_4;
  wire \n_1_count_reg[0]_i_1 ;
  wire \n_1_count_reg[4]_i_1 ;
  wire \n_1_count_reg[8]_i_1 ;
  wire \n_2_count_reg[0]_i_1 ;
  wire \n_2_count_reg[4]_i_1 ;
  wire \n_2_count_reg[8]_i_1 ;
  wire \n_3_count_reg[0]_i_1 ;
  wire \n_3_count_reg[4]_i_1 ;
  wire \n_3_count_reg[8]_i_1 ;
  wire \n_4_count_reg[0]_i_1 ;
  wire \n_4_count_reg[4]_i_1 ;
  wire \n_4_count_reg[8]_i_1 ;
  wire \n_5_count_reg[0]_i_1 ;
  wire \n_5_count_reg[4]_i_1 ;
  wire \n_5_count_reg[8]_i_1 ;
  wire \n_6_count_reg[0]_i_1 ;
  wire \n_6_count_reg[4]_i_1 ;
  wire \n_6_count_reg[8]_i_1 ;
  wire \n_7_count_reg[0]_i_1 ;
  wire \n_7_count_reg[4]_i_1 ;
  wire \n_7_count_reg[8]_i_1 ;
  wire p_0_in;
  wire reset;
  wire s_tick;
  wire xlnx_opt_;
  wire [3:1]NLW_CARRY4_CO_UNCONNECTED;
  wire [3:1]NLW_CARRY4_DI_UNCONNECTED;
  wire [3:0]NLW_CARRY4_O_UNCONNECTED;
  wire [3:1]NLW_CARRY4_S_UNCONNECTED;

CARRY4 CARRY4
       (.CI(xlnx_opt_),
        .CO({NLW_CARRY4_CO_UNCONNECTED[3:1],\n_0_count_reg[8]_i_1 }),
        .CYINIT(1'b0),
        .DI({NLW_CARRY4_DI_UNCONNECTED[3:1],1'b0}),
        .O(NLW_CARRY4_O_UNCONNECTED[3:0]),
        .S({NLW_CARRY4_S_UNCONNECTED[3:1],1'b1}));
LUT2 #(
    .INIT(4'h2)) 
     \count[0]_i_2 
       (.I0(count_reg[0]),
        .I1(p_0_in),
        .O(\n_0_count[0]_i_2 ));
LUT2 #(
    .INIT(4'h2)) 
     \count[0]_i_3 
       (.I0(count_reg[3]),
        .I1(p_0_in),
        .O(\n_0_count[0]_i_3 ));
LUT2 #(
    .INIT(4'h2)) 
     \count[0]_i_4 
       (.I0(count_reg[2]),
        .I1(p_0_in),
        .O(\n_0_count[0]_i_4 ));
LUT2 #(
    .INIT(4'h2)) 
     \count[0]_i_5 
       (.I0(count_reg[1]),
        .I1(p_0_in),
        .O(\n_0_count[0]_i_5 ));
LUT2 #(
    .INIT(4'h1)) 
     \count[0]_i_6 
       (.I0(count_reg[0]),
        .I1(p_0_in),
        .O(\n_0_count[0]_i_6 ));
LUT2 #(
    .INIT(4'h2)) 
     \count[4]_i_2 
       (.I0(count_reg[7]),
        .I1(p_0_in),
        .O(\n_0_count[4]_i_2 ));
LUT2 #(
    .INIT(4'h2)) 
     \count[4]_i_3 
       (.I0(count_reg[6]),
        .I1(p_0_in),
        .O(\n_0_count[4]_i_3 ));
LUT2 #(
    .INIT(4'h2)) 
     \count[4]_i_4 
       (.I0(count_reg[5]),
        .I1(p_0_in),
        .O(\n_0_count[4]_i_4 ));
LUT2 #(
    .INIT(4'h2)) 
     \count[4]_i_5 
       (.I0(count_reg[4]),
        .I1(p_0_in),
        .O(\n_0_count[4]_i_5 ));
LUT2 #(
    .INIT(4'h2)) 
     \count[8]_i_2 
       (.I0(count_reg[9]),
        .I1(p_0_in),
        .O(\n_0_count[8]_i_2 ));
LUT2 #(
    .INIT(4'h2)) 
     \count[8]_i_3 
       (.I0(count_reg[8]),
        .I1(p_0_in),
        .O(\n_0_count[8]_i_3 ));
(* counter = "1" *) 
   FDCE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_7_count_reg[0]_i_1 ),
        .Q(count_reg[0]));
CARRY4 \count_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\n_0_count_reg[0]_i_1 ,\n_1_count_reg[0]_i_1 ,\n_2_count_reg[0]_i_1 ,\n_3_count_reg[0]_i_1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\n_0_count[0]_i_2 }),
        .O({\n_4_count_reg[0]_i_1 ,\n_5_count_reg[0]_i_1 ,\n_6_count_reg[0]_i_1 ,\n_7_count_reg[0]_i_1 }),
        .S({\n_0_count[0]_i_3 ,\n_0_count[0]_i_4 ,\n_0_count[0]_i_5 ,\n_0_count[0]_i_6 }));
(* counter = "1" *) 
   FDCE \count_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_5_count_reg[8]_i_1 ),
        .Q(count_reg[10]));
(* counter = "1" *) 
   FDCE \count_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_4_count_reg[8]_i_1 ),
        .Q(count_reg[11]));
(* counter = "1" *) 
   FDCE \count_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_0_count_reg[8]_i_1 ),
        .Q(count_reg[12]));
(* counter = "1" *) 
   FDCE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_6_count_reg[0]_i_1 ),
        .Q(count_reg[1]));
(* counter = "1" *) 
   FDCE \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_5_count_reg[0]_i_1 ),
        .Q(count_reg[2]));
(* counter = "1" *) 
   FDCE \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_4_count_reg[0]_i_1 ),
        .Q(count_reg[3]));
(* counter = "1" *) 
   FDCE \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_7_count_reg[4]_i_1 ),
        .Q(count_reg[4]));
CARRY4 \count_reg[4]_i_1 
       (.CI(\n_0_count_reg[0]_i_1 ),
        .CO({\n_0_count_reg[4]_i_1 ,\n_1_count_reg[4]_i_1 ,\n_2_count_reg[4]_i_1 ,\n_3_count_reg[4]_i_1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_count_reg[4]_i_1 ,\n_5_count_reg[4]_i_1 ,\n_6_count_reg[4]_i_1 ,\n_7_count_reg[4]_i_1 }),
        .S({\n_0_count[4]_i_2 ,\n_0_count[4]_i_3 ,\n_0_count[4]_i_4 ,\n_0_count[4]_i_5 }));
(* counter = "1" *) 
   FDCE \count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_6_count_reg[4]_i_1 ),
        .Q(count_reg[5]));
(* counter = "1" *) 
   FDCE \count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_5_count_reg[4]_i_1 ),
        .Q(count_reg[6]));
(* counter = "1" *) 
   FDCE \count_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_4_count_reg[4]_i_1 ),
        .Q(count_reg[7]));
(* counter = "1" *) 
   FDCE \count_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_7_count_reg[8]_i_1 ),
        .Q(count_reg[8]));
CARRY4 \count_reg[8]_i_1 
       (.CI(\n_0_count_reg[4]_i_1 ),
        .CO({xlnx_opt_,\n_1_count_reg[8]_i_1 ,\n_2_count_reg[8]_i_1 ,\n_3_count_reg[8]_i_1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_count_reg[8]_i_1 ,\n_5_count_reg[8]_i_1 ,\n_6_count_reg[8]_i_1 ,\n_7_count_reg[8]_i_1 }),
        .S({1'b0,1'b0,\n_0_count[8]_i_2 ,\n_0_count[8]_i_3 }));
(* counter = "1" *) 
   FDCE \count_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_6_count_reg[8]_i_1 ),
        .Q(count_reg[9]));
LUT6 #(
    .INIT(64'hFEFEFEFEFFFEFFFF)) 
     tick_i_1
       (.I0(count_reg[11]),
        .I1(count_reg[10]),
        .I2(count_reg[12]),
        .I3(n_0_tick_i_2),
        .I4(n_0_tick_i_3),
        .I5(n_0_tick_i_4),
        .O(p_0_in));
LUT4 #(
    .INIT(16'hFFFE)) 
     tick_i_2
       (.I0(count_reg[5]),
        .I1(count_reg[8]),
        .I2(count_reg[6]),
        .I3(count_reg[4]),
        .O(n_0_tick_i_2));
LUT4 #(
    .INIT(16'h15FF)) 
     tick_i_3
       (.I0(count_reg[2]),
        .I1(count_reg[1]),
        .I2(count_reg[0]),
        .I3(count_reg[3]),
        .O(n_0_tick_i_3));
LUT3 #(
    .INIT(8'h57)) 
     tick_i_4
       (.I0(count_reg[9]),
        .I1(count_reg[7]),
        .I2(count_reg[8]),
        .O(n_0_tick_i_4));
FDCE tick_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(p_0_in),
        .Q(s_tick));
endmodule

(* ORIG_REF_NAME = "uart_rx" *) 
module UART_0_uart_rx
   (O1,
    data_out,
    clk,
    reset,
    rx,
    s_tick);
  output O1;
  output [7:0]data_out;
  input clk;
  input reset;
  input rx;
  input s_tick;

  wire O1;
  wire clk;
  wire [7:0]data_out;
  wire [3:0]n;
  wire \n_0_n[0]_i_1 ;
  wire \n_0_n[1]_i_1 ;
  wire \n_0_n[2]_i_1 ;
  wire \n_0_n[3]_i_1 ;
  wire \n_0_n[3]_i_2 ;
  wire n_0_rx_done_i_1;
  wire n_0_rx_done_i_2;
  wire \n_0_rx_reg[7]_i_1 ;
  wire \n_0_rx_reg[7]_i_2 ;
  wire \n_0_s[3]_i_1 ;
  wire \n_0_s[3]_i_3 ;
  wire \n_0_state[0]_i_1 ;
  wire \n_0_state[1]_i_1 ;
  wire \n_0_state[1]_i_2__0 ;
  wire \n_0_state[1]_i_3 ;
  wire [3:0]p_0_out;
  wire [6:0]p_1_in;
  wire reset;
  wire rx;
  wire [0:0]rx_reg;
  wire [3:0]s;
  wire s_tick;
  wire [1:0]state;

(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT2 #(
    .INIT(4'h8)) 
     \data_out[0]_INST_0 
       (.I0(O1),
        .I1(rx_reg),
        .O(data_out[0]));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT2 #(
    .INIT(4'h8)) 
     \data_out[1]_INST_0 
       (.I0(O1),
        .I1(p_1_in[0]),
        .O(data_out[1]));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT2 #(
    .INIT(4'h8)) 
     \data_out[2]_INST_0 
       (.I0(O1),
        .I1(p_1_in[1]),
        .O(data_out[2]));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT2 #(
    .INIT(4'h8)) 
     \data_out[3]_INST_0 
       (.I0(O1),
        .I1(p_1_in[2]),
        .O(data_out[3]));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT2 #(
    .INIT(4'h8)) 
     \data_out[4]_INST_0 
       (.I0(O1),
        .I1(p_1_in[3]),
        .O(data_out[4]));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT2 #(
    .INIT(4'h8)) 
     \data_out[5]_INST_0 
       (.I0(O1),
        .I1(p_1_in[4]),
        .O(data_out[5]));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT2 #(
    .INIT(4'h8)) 
     \data_out[6]_INST_0 
       (.I0(O1),
        .I1(p_1_in[5]),
        .O(data_out[6]));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT2 #(
    .INIT(4'h8)) 
     \data_out[7]_INST_0 
       (.I0(O1),
        .I1(p_1_in[6]),
        .O(data_out[7]));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT2 #(
    .INIT(4'h2)) 
     \n[0]_i_1 
       (.I0(state[1]),
        .I1(n[0]),
        .O(\n_0_n[0]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT3 #(
    .INIT(8'h48)) 
     \n[1]_i_1 
       (.I0(n[0]),
        .I1(state[1]),
        .I2(n[1]),
        .O(\n_0_n[1]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT4 #(
    .INIT(16'h7080)) 
     \n[2]_i_1 
       (.I0(n[0]),
        .I1(n[1]),
        .I2(state[1]),
        .I3(n[2]),
        .O(\n_0_n[2]_i_1 ));
LUT6 #(
    .INIT(64'h0000030020000000)) 
     \n[3]_i_1 
       (.I0(\n_0_state[1]_i_2__0 ),
        .I1(\n_0_s[3]_i_3 ),
        .I2(s[3]),
        .I3(s_tick),
        .I4(state[1]),
        .I5(state[0]),
        .O(\n_0_n[3]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT5 #(
    .INIT(32'h7F800000)) 
     \n[3]_i_2 
       (.I0(n[2]),
        .I1(n[0]),
        .I2(n[1]),
        .I3(n[3]),
        .I4(state[1]),
        .O(\n_0_n[3]_i_2 ));
FDCE \n_reg[0] 
       (.C(clk),
        .CE(\n_0_n[3]_i_1 ),
        .CLR(reset),
        .D(\n_0_n[0]_i_1 ),
        .Q(n[0]));
FDCE \n_reg[1] 
       (.C(clk),
        .CE(\n_0_n[3]_i_1 ),
        .CLR(reset),
        .D(\n_0_n[1]_i_1 ),
        .Q(n[1]));
FDCE \n_reg[2] 
       (.C(clk),
        .CE(\n_0_n[3]_i_1 ),
        .CLR(reset),
        .D(\n_0_n[2]_i_1 ),
        .Q(n[2]));
FDCE \n_reg[3] 
       (.C(clk),
        .CE(\n_0_n[3]_i_1 ),
        .CLR(reset),
        .D(\n_0_n[3]_i_2 ),
        .Q(n[3]));
LUT6 #(
    .INIT(64'hFFFFFFF044000000)) 
     rx_done_i_1
       (.I0(n_0_rx_done_i_2),
        .I1(s_tick),
        .I2(rx),
        .I3(state[0]),
        .I4(state[1]),
        .I5(O1),
        .O(n_0_rx_done_i_1));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT4 #(
    .INIT(16'h7FFF)) 
     rx_done_i_2
       (.I0(s[2]),
        .I1(s[0]),
        .I2(s[1]),
        .I3(s[3]),
        .O(n_0_rx_done_i_2));
FDCE rx_done_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(n_0_rx_done_i_1),
        .Q(O1));
LUT6 #(
    .INIT(64'h4000000000000000)) 
     \rx_reg[7]_i_1 
       (.I0(state[0]),
        .I1(\n_0_rx_reg[7]_i_2 ),
        .I2(s[3]),
        .I3(s[1]),
        .I4(s[0]),
        .I5(s[2]),
        .O(\n_0_rx_reg[7]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT2 #(
    .INIT(4'h8)) 
     \rx_reg[7]_i_2 
       (.I0(state[1]),
        .I1(s_tick),
        .O(\n_0_rx_reg[7]_i_2 ));
FDCE \rx_reg_reg[0] 
       (.C(clk),
        .CE(\n_0_rx_reg[7]_i_1 ),
        .CLR(reset),
        .D(p_1_in[0]),
        .Q(rx_reg));
FDCE \rx_reg_reg[1] 
       (.C(clk),
        .CE(\n_0_rx_reg[7]_i_1 ),
        .CLR(reset),
        .D(p_1_in[1]),
        .Q(p_1_in[0]));
FDCE \rx_reg_reg[2] 
       (.C(clk),
        .CE(\n_0_rx_reg[7]_i_1 ),
        .CLR(reset),
        .D(p_1_in[2]),
        .Q(p_1_in[1]));
FDCE \rx_reg_reg[3] 
       (.C(clk),
        .CE(\n_0_rx_reg[7]_i_1 ),
        .CLR(reset),
        .D(p_1_in[3]),
        .Q(p_1_in[2]));
FDCE \rx_reg_reg[4] 
       (.C(clk),
        .CE(\n_0_rx_reg[7]_i_1 ),
        .CLR(reset),
        .D(p_1_in[4]),
        .Q(p_1_in[3]));
FDCE \rx_reg_reg[5] 
       (.C(clk),
        .CE(\n_0_rx_reg[7]_i_1 ),
        .CLR(reset),
        .D(p_1_in[5]),
        .Q(p_1_in[4]));
FDCE \rx_reg_reg[6] 
       (.C(clk),
        .CE(\n_0_rx_reg[7]_i_1 ),
        .CLR(reset),
        .D(p_1_in[6]),
        .Q(p_1_in[5]));
FDCE \rx_reg_reg[7] 
       (.C(clk),
        .CE(\n_0_rx_reg[7]_i_1 ),
        .CLR(reset),
        .D(rx),
        .Q(p_1_in[6]));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT4 #(
    .INIT(16'h5754)) 
     \s[0]_i_1__0 
       (.I0(s[0]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(rx),
        .O(p_0_out[0]));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT5 #(
    .INIT(32'h02FEFE02)) 
     \s[1]_i_1__0 
       (.I0(rx),
        .I1(state[0]),
        .I2(state[1]),
        .I3(s[1]),
        .I4(s[0]),
        .O(p_0_out[1]));
LUT6 #(
    .INIT(64'h02FEFEFEFE020202)) 
     \s[2]_i_1__0 
       (.I0(rx),
        .I1(state[0]),
        .I2(state[1]),
        .I3(s[1]),
        .I4(s[0]),
        .I5(s[2]),
        .O(p_0_out[2]));
LUT5 #(
    .INIT(32'hAFF30003)) 
     \s[3]_i_1 
       (.I0(n_0_rx_done_i_2),
        .I1(rx),
        .I2(state[0]),
        .I3(state[1]),
        .I4(s_tick),
        .O(\n_0_s[3]_i_1 ));
LUT5 #(
    .INIT(32'hCCCA303A)) 
     \s[3]_i_2__0 
       (.I0(rx),
        .I1(\n_0_s[3]_i_3 ),
        .I2(state[1]),
        .I3(state[0]),
        .I4(s[3]),
        .O(p_0_out[3]));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT3 #(
    .INIT(8'h7F)) 
     \s[3]_i_3 
       (.I0(s[1]),
        .I1(s[0]),
        .I2(s[2]),
        .O(\n_0_s[3]_i_3 ));
FDCE \s_reg[0] 
       (.C(clk),
        .CE(\n_0_s[3]_i_1 ),
        .CLR(reset),
        .D(p_0_out[0]),
        .Q(s[0]));
FDCE \s_reg[1] 
       (.C(clk),
        .CE(\n_0_s[3]_i_1 ),
        .CLR(reset),
        .D(p_0_out[1]),
        .Q(s[1]));
FDCE \s_reg[2] 
       (.C(clk),
        .CE(\n_0_s[3]_i_1 ),
        .CLR(reset),
        .D(p_0_out[2]),
        .Q(s[2]));
FDCE \s_reg[3] 
       (.C(clk),
        .CE(\n_0_s[3]_i_1 ),
        .CLR(reset),
        .D(p_0_out[3]),
        .Q(s[3]));
LUT6 #(
    .INIT(64'h0000FFBFCFCF0040)) 
     \state[0]_i_1 
       (.I0(\n_0_state[1]_i_2__0 ),
        .I1(s_tick),
        .I2(state[1]),
        .I3(n_0_rx_done_i_2),
        .I4(\n_0_state[1]_i_3 ),
        .I5(state[0]),
        .O(\n_0_state[0]_i_1 ));
LUT6 #(
    .INIT(64'h50AA50AAFF00DF00)) 
     \state[1]_i_1 
       (.I0(state[0]),
        .I1(\n_0_state[1]_i_2__0 ),
        .I2(s_tick),
        .I3(state[1]),
        .I4(n_0_rx_done_i_2),
        .I5(\n_0_state[1]_i_3 ),
        .O(\n_0_state[1]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT4 #(
    .INIT(16'hFF7F)) 
     \state[1]_i_2__0 
       (.I0(n[2]),
        .I1(n[0]),
        .I2(n[1]),
        .I3(n[3]),
        .O(\n_0_state[1]_i_2__0 ));
LUT6 #(
    .INIT(64'h0101010189014501)) 
     \state[1]_i_3 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(rx),
        .I3(s_tick),
        .I4(s[3]),
        .I5(\n_0_s[3]_i_3 ),
        .O(\n_0_state[1]_i_3 ));
FDCE \state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_0_state[0]_i_1 ),
        .Q(state[0]));
FDCE \state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_0_state[1]_i_1 ),
        .Q(state[1]));
endmodule

(* ORIG_REF_NAME = "uart_top" *) 
module UART_0_uart_top
   (data_out,
    O1,
    tx,
    tx_done,
    clk,
    reset,
    rx,
    tx_btn,
    data_in);
  output [7:0]data_out;
  output O1;
  output tx;
  output tx_done;
  input clk;
  input reset;
  input rx;
  input tx_btn;
  input [7:0]data_in;

  wire O1;
  wire btn_buf;
  wire clk;
  wire [7:0]data_in;
  wire [7:0]data_out;
  wire reset;
  wire rx;
  wire s_tick;
  wire tx;
  wire tx_btn;
  wire tx_done;

UART_0_clk CLK_div
       (.clk(clk),
        .reset(reset),
        .s_tick(s_tick));
UART_0_uart_rx RX
       (.O1(O1),
        .clk(clk),
        .data_out(data_out),
        .reset(reset),
        .rx(rx),
        .s_tick(s_tick));
UART_0_uart_tx TX
       (.btn_buf(btn_buf),
        .clk(clk),
        .data_in(data_in),
        .reset(reset),
        .s_tick(s_tick),
        .tx(tx),
        .tx_btn(tx_btn),
        .tx_done(tx_done));
FDRE btn_buf_reg
       (.C(clk),
        .CE(1'b1),
        .D(tx_btn),
        .Q(btn_buf),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "uart_tx" *) 
module UART_0_uart_tx
   (tx,
    tx_done,
    clk,
    reset,
    s_tick,
    tx_btn,
    btn_buf,
    data_in);
  output tx;
  output tx_done;
  input clk;
  input reset;
  input s_tick;
  input tx_btn;
  input btn_buf;
  input [7:0]data_in;

  wire btn_buf;
  wire clk;
  wire [7:0]data_in;
  wire [7:0]data_next;
  wire [0:0]data_reg;
  wire [2:0]n;
  wire \n_0_data_reg[7]_i_1 ;
  wire \n_0_data_reg_reg[1] ;
  wire \n_0_data_reg_reg[2] ;
  wire \n_0_data_reg_reg[3] ;
  wire \n_0_data_reg_reg[4] ;
  wire \n_0_data_reg_reg[5] ;
  wire \n_0_data_reg_reg[6] ;
  wire \n_0_data_reg_reg[7] ;
  wire \n_0_n[0]_i_1 ;
  wire \n_0_n[1]_i_1 ;
  wire \n_0_n[2]_i_1 ;
  wire \n_0_n[2]_i_2 ;
  wire \n_0_s[3]_i_1__0 ;
  wire \n_0_state[0]_i_1 ;
  wire \n_0_state[1]_i_1 ;
  wire \n_0_state[1]_i_2 ;
  wire n_0_tx_done_i_1;
  wire n_0_tx_done_i_2;
  wire n_0_tx_done_i_3;
  wire n_0_tx_i_1;
  wire reset;
  wire [3:0]s;
  wire [3:0]s_next;
  wire s_tick;
  wire [1:0]state;
  wire tx;
  wire tx_btn;
  wire tx_done;

LUT3 #(
    .INIT(8'hB8)) 
     \data_reg[0]_i_1 
       (.I0(\n_0_data_reg_reg[1] ),
        .I1(state[1]),
        .I2(data_in[0]),
        .O(data_next[0]));
(* SOFT_HLUTNM = "soft_lutpair15" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \data_reg[1]_i_1 
       (.I0(\n_0_data_reg_reg[2] ),
        .I1(state[1]),
        .I2(data_in[1]),
        .O(data_next[1]));
(* SOFT_HLUTNM = "soft_lutpair14" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \data_reg[2]_i_1 
       (.I0(\n_0_data_reg_reg[3] ),
        .I1(state[1]),
        .I2(data_in[2]),
        .O(data_next[2]));
(* SOFT_HLUTNM = "soft_lutpair13" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \data_reg[3]_i_1 
       (.I0(\n_0_data_reg_reg[4] ),
        .I1(state[1]),
        .I2(data_in[3]),
        .O(data_next[3]));
(* SOFT_HLUTNM = "soft_lutpair15" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \data_reg[4]_i_1 
       (.I0(\n_0_data_reg_reg[5] ),
        .I1(state[1]),
        .I2(data_in[4]),
        .O(data_next[4]));
(* SOFT_HLUTNM = "soft_lutpair14" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \data_reg[5]_i_1 
       (.I0(\n_0_data_reg_reg[6] ),
        .I1(state[1]),
        .I2(data_in[5]),
        .O(data_next[5]));
(* SOFT_HLUTNM = "soft_lutpair13" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \data_reg[6]_i_1 
       (.I0(\n_0_data_reg_reg[7] ),
        .I1(state[1]),
        .I2(data_in[6]),
        .O(data_next[6]));
LUT6 #(
    .INIT(64'h04000400040F0400)) 
     \data_reg[7]_i_1 
       (.I0(n_0_tx_done_i_2),
        .I1(s_tick),
        .I2(state[0]),
        .I3(state[1]),
        .I4(tx_btn),
        .I5(btn_buf),
        .O(\n_0_data_reg[7]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair12" *) 
   LUT2 #(
    .INIT(4'h2)) 
     \data_reg[7]_i_2 
       (.I0(data_in[7]),
        .I1(state[1]),
        .O(data_next[7]));
FDCE \data_reg_reg[0] 
       (.C(clk),
        .CE(\n_0_data_reg[7]_i_1 ),
        .CLR(reset),
        .D(data_next[0]),
        .Q(data_reg));
FDCE \data_reg_reg[1] 
       (.C(clk),
        .CE(\n_0_data_reg[7]_i_1 ),
        .CLR(reset),
        .D(data_next[1]),
        .Q(\n_0_data_reg_reg[1] ));
FDCE \data_reg_reg[2] 
       (.C(clk),
        .CE(\n_0_data_reg[7]_i_1 ),
        .CLR(reset),
        .D(data_next[2]),
        .Q(\n_0_data_reg_reg[2] ));
FDCE \data_reg_reg[3] 
       (.C(clk),
        .CE(\n_0_data_reg[7]_i_1 ),
        .CLR(reset),
        .D(data_next[3]),
        .Q(\n_0_data_reg_reg[3] ));
FDCE \data_reg_reg[4] 
       (.C(clk),
        .CE(\n_0_data_reg[7]_i_1 ),
        .CLR(reset),
        .D(data_next[4]),
        .Q(\n_0_data_reg_reg[4] ));
FDCE \data_reg_reg[5] 
       (.C(clk),
        .CE(\n_0_data_reg[7]_i_1 ),
        .CLR(reset),
        .D(data_next[5]),
        .Q(\n_0_data_reg_reg[5] ));
FDCE \data_reg_reg[6] 
       (.C(clk),
        .CE(\n_0_data_reg[7]_i_1 ),
        .CLR(reset),
        .D(data_next[6]),
        .Q(\n_0_data_reg_reg[6] ));
FDCE \data_reg_reg[7] 
       (.C(clk),
        .CE(\n_0_data_reg[7]_i_1 ),
        .CLR(reset),
        .D(data_next[7]),
        .Q(\n_0_data_reg_reg[7] ));
(* SOFT_HLUTNM = "soft_lutpair10" *) 
   LUT3 #(
    .INIT(8'h38)) 
     \n[0]_i_1 
       (.I0(state[1]),
        .I1(\n_0_n[2]_i_2 ),
        .I2(n[0]),
        .O(\n_0_n[0]_i_1 ));
LUT6 #(
    .INIT(64'hFFFFF37F00000080)) 
     \n[1]_i_1 
       (.I0(n[0]),
        .I1(s_tick),
        .I2(state[1]),
        .I3(state[0]),
        .I4(n_0_tx_done_i_2),
        .I5(n[1]),
        .O(\n_0_n[1]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair10" *) 
   LUT5 #(
    .INIT(32'h70FF8000)) 
     \n[2]_i_1 
       (.I0(n[0]),
        .I1(n[1]),
        .I2(state[1]),
        .I3(\n_0_n[2]_i_2 ),
        .I4(n[2]),
        .O(\n_0_n[2]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair11" *) 
   LUT4 #(
    .INIT(16'h0028)) 
     \n[2]_i_2 
       (.I0(s_tick),
        .I1(state[1]),
        .I2(state[0]),
        .I3(n_0_tx_done_i_2),
        .O(\n_0_n[2]_i_2 ));
FDCE \n_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_0_n[0]_i_1 ),
        .Q(n[0]));
FDCE \n_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_0_n[1]_i_1 ),
        .Q(n[1]));
FDCE \n_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_0_n[2]_i_1 ),
        .Q(n[2]));
(* SOFT_HLUTNM = "soft_lutpair11" *) 
   LUT3 #(
    .INIT(8'h0E)) 
     \s[0]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(s[0]),
        .O(s_next[0]));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT4 #(
    .INIT(16'h0EE0)) 
     \s[1]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(s[0]),
        .I3(s[1]),
        .O(s_next[1]));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT5 #(
    .INIT(32'h77708880)) 
     \s[2]_i_1 
       (.I0(s[0]),
        .I1(s[1]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(s[2]),
        .O(s_next[2]));
LUT6 #(
    .INIT(64'hFF55BABA00001010)) 
     \s[3]_i_1__0 
       (.I0(state[0]),
        .I1(btn_buf),
        .I2(tx_btn),
        .I3(n_0_tx_done_i_2),
        .I4(state[1]),
        .I5(s_tick),
        .O(\n_0_s[3]_i_1__0 ));
LUT6 #(
    .INIT(64'h7F7F7F0080808000)) 
     \s[3]_i_2 
       (.I0(s[1]),
        .I1(s[0]),
        .I2(s[2]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(s[3]),
        .O(s_next[3]));
FDCE \s_reg[0] 
       (.C(clk),
        .CE(\n_0_s[3]_i_1__0 ),
        .CLR(reset),
        .D(s_next[0]),
        .Q(s[0]));
FDCE \s_reg[1] 
       (.C(clk),
        .CE(\n_0_s[3]_i_1__0 ),
        .CLR(reset),
        .D(s_next[1]),
        .Q(s[1]));
FDCE \s_reg[2] 
       (.C(clk),
        .CE(\n_0_s[3]_i_1__0 ),
        .CLR(reset),
        .D(s_next[2]),
        .Q(s[2]));
FDCE \s_reg[3] 
       (.C(clk),
        .CE(\n_0_s[3]_i_1__0 ),
        .CLR(reset),
        .D(s_next[3]),
        .Q(s[3]));
LUT6 #(
    .INIT(64'h00F0CD2000FFCD22)) 
     \state[0]_i_1 
       (.I0(\n_0_state[1]_i_2 ),
        .I1(n_0_tx_done_i_2),
        .I2(s_tick),
        .I3(state[0]),
        .I4(n_0_tx_done_i_3),
        .I5(state[1]),
        .O(\n_0_state[0]_i_1 ));
LUT6 #(
    .INIT(64'h00F0CDFDFF003200)) 
     \state[1]_i_1 
       (.I0(\n_0_state[1]_i_2 ),
        .I1(n_0_tx_done_i_2),
        .I2(s_tick),
        .I3(state[0]),
        .I4(n_0_tx_done_i_3),
        .I5(state[1]),
        .O(\n_0_state[1]_i_1 ));
LUT5 #(
    .INIT(32'h80000000)) 
     \state[1]_i_2 
       (.I0(s_tick),
        .I1(state[1]),
        .I2(n[2]),
        .I3(n[0]),
        .I4(n[1]),
        .O(\n_0_state[1]_i_2 ));
FDCE \state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_0_state[0]_i_1 ),
        .Q(state[0]));
FDCE \state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(\n_0_state[1]_i_1 ),
        .Q(state[1]));
LUT6 #(
    .INIT(64'hC0C0FFFFC0C04000)) 
     tx_done_i_1
       (.I0(n_0_tx_done_i_2),
        .I1(s_tick),
        .I2(state[1]),
        .I3(state[0]),
        .I4(n_0_tx_done_i_3),
        .I5(tx_done),
        .O(n_0_tx_done_i_1));
LUT4 #(
    .INIT(16'h7FFF)) 
     tx_done_i_2
       (.I0(s[2]),
        .I1(s[0]),
        .I2(s[1]),
        .I3(s[3]),
        .O(n_0_tx_done_i_2));
(* SOFT_HLUTNM = "soft_lutpair12" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     tx_done_i_3
       (.I0(btn_buf),
        .I1(tx_btn),
        .I2(state[1]),
        .I3(state[0]),
        .O(n_0_tx_done_i_3));
FDCE tx_done_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(n_0_tx_done_i_1),
        .Q(tx_done));
LUT4 #(
    .INIT(16'hE3E0)) 
     tx_i_1
       (.I0(data_reg),
        .I1(state[0]),
        .I2(state[1]),
        .I3(tx),
        .O(n_0_tx_i_1));
FDCE tx_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(reset),
        .D(n_0_tx_i_1),
        .Q(tx));
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
