// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
// Date        : Sun Oct 12 01:58:03 2014
// Host        : xshxup31 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               C:/xilinx_workspace/bluetooth_uart/bluetooth_uart.srcs/sources_1/ip/UART_0/UART_0_stub.v
// Design      : UART_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "uart_top,Vivado 2014.2" *)
module UART_0(clk, reset, rx, tx_btn, data_in, data_out, rx_done, tx_done, tx)
/* synthesis syn_black_box black_box_pad_pin="clk,reset,rx,tx_btn,data_in[7:0],data_out[7:0],rx_done,tx_done,tx" */;
  input clk;
  input reset;
  input rx;
  input tx_btn;
  input [7:0]data_in;
  output [7:0]data_out;
  output rx_done;
  output tx_done;
  output tx;
endmodule
