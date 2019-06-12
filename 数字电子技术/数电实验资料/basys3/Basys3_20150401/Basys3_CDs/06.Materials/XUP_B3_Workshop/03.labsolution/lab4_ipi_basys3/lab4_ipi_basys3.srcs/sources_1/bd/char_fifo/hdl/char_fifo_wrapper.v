//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
//Date        : Mon Aug 18 17:57:37 2014
//Host        : XSJYCW33 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target char_fifo_wrapper.bd
//Design      : char_fifo_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module char_fifo_wrapper
   (char_fifo_din,
    char_fifo_dout,
    char_fifo_empty,
    char_fifo_full,
    char_fifo_rd_en,
    char_fifo_wr_en,
    clk_rx,
    clk_tx,
    rst_i);
  input [7:0]char_fifo_din;
  output [7:0]char_fifo_dout;
  output char_fifo_empty;
  output char_fifo_full;
  input char_fifo_rd_en;
  input char_fifo_wr_en;
  input clk_rx;
  input clk_tx;
  input rst_i;

  wire [7:0]char_fifo_din;
  wire [7:0]char_fifo_dout;
  wire char_fifo_empty;
  wire char_fifo_full;
  wire char_fifo_rd_en;
  wire char_fifo_wr_en;
  wire clk_rx;
  wire clk_tx;
  wire rst_i;

char_fifo char_fifo_i
       (.char_fifo_din(char_fifo_din),
        .char_fifo_dout(char_fifo_dout),
        .char_fifo_empty(char_fifo_empty),
        .char_fifo_full(char_fifo_full),
        .char_fifo_rd_en(char_fifo_rd_en),
        .char_fifo_wr_en(char_fifo_wr_en),
        .clk_rx(clk_rx),
        .clk_tx(clk_tx),
        .rst_i(rst_i));
endmodule
