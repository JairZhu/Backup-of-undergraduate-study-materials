//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
//Date        : Mon Aug 18 17:57:37 2014
//Host        : XSJYCW33 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target char_fifo.bd
//Design      : char_fifo
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* core_generation_info = "char_fifo,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0}" *) 
module char_fifo
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

  wire [7:0]char_fifo_din_1;
  wire char_fifo_rd_en_1;
  wire char_fifo_wr_en_1;
  wire clk_rx_1;
  wire clk_tx_1;
  wire [7:0]fifo_generator_0_dout;
  wire fifo_generator_0_empty;
  wire fifo_generator_0_full;
  wire rst_1;

  assign char_fifo_din_1 = char_fifo_din[7:0];
  assign char_fifo_dout[7:0] = fifo_generator_0_dout;
  assign char_fifo_empty = fifo_generator_0_empty;
  assign char_fifo_full = fifo_generator_0_full;
  assign char_fifo_rd_en_1 = char_fifo_rd_en;
  assign char_fifo_wr_en_1 = char_fifo_wr_en;
  assign clk_rx_1 = clk_rx;
  assign clk_tx_1 = clk_tx;
  assign rst_1 = rst_i;
char_fifo_fifo_generator_0_1 fifo_generator_0
       (.din(char_fifo_din_1),
        .dout(fifo_generator_0_dout),
        .empty(fifo_generator_0_empty),
        .full(fifo_generator_0_full),
        .rd_clk(clk_tx_1),
        .rd_en(char_fifo_rd_en_1),
        .rst(rst_1),
        .wr_clk(clk_rx_1),
        .wr_en(char_fifo_wr_en_1));
endmodule
