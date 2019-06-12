// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Wed Nov 15 23:44:02 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_ControlUnit_0_0/design_1_ControlUnit_0_0_sim_netlist.v
// Design      : design_1_ControlUnit_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_ControlUnit_0_0,ControlUnit,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "ControlUnit,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module design_1_ControlUnit_0_0
   (op,
    Zero,
    Sign,
    ExtSel,
    PCWre,
    InsMemRW,
    RegDst,
    RegWre,
    AluOp,
    AluSrcA,
    AluSrcB,
    RD,
    WR,
    DBDataSrc,
    PCSrc);
  input [5:0]op;
  input Zero;
  input Sign;
  output ExtSel;
  output PCWre;
  output InsMemRW;
  output RegDst;
  output RegWre;
  output [2:0]AluOp;
  output AluSrcA;
  output AluSrcB;
  output RD;
  output WR;
  output DBDataSrc;
  output [1:0]PCSrc;

  wire \<const1> ;
  wire [2:0]AluOp;
  wire AluSrcA;
  wire AluSrcB;
  wire DBDataSrc;
  wire ExtSel;
  wire [1:0]PCSrc;
  wire \PCSrc[0]_INST_0_i_1_n_0 ;
  wire PCWre;
  wire RD;
  wire RegDst;
  wire RegWre;
  wire WR;
  wire Zero;
  wire [5:0]op;

  assign InsMemRW = \<const1> ;
  LUT6 #(
    .INIT(64'h000000C500200020)) 
    \AluOp[0]_INST_0 
       (.I0(op[1]),
        .I1(op[0]),
        .I2(op[5]),
        .I3(op[4]),
        .I4(op[3]),
        .I5(op[2]),
        .O(AluOp[0]));
  LUT6 #(
    .INIT(64'h020200010A000000)) 
    \AluOp[1]_INST_0 
       (.I0(op[2]),
        .I1(op[3]),
        .I2(op[4]),
        .I3(op[5]),
        .I4(op[0]),
        .I5(op[1]),
        .O(AluOp[1]));
  LUT6 #(
    .INIT(64'h0002000001002000)) 
    \AluOp[2]_INST_0 
       (.I0(op[1]),
        .I1(op[4]),
        .I2(op[3]),
        .I3(op[5]),
        .I4(op[2]),
        .I5(op[0]),
        .O(AluOp[2]));
  LUT6 #(
    .INIT(64'h1000000000000000)) 
    AluSrcA_INST_0
       (.I0(op[1]),
        .I1(op[4]),
        .I2(op[3]),
        .I3(op[0]),
        .I4(op[5]),
        .I5(op[2]),
        .O(AluSrcA));
  LUT5 #(
    .INIT(32'h02000020)) 
    AluSrcB_INST_0
       (.I0(op[5]),
        .I1(op[4]),
        .I2(op[3]),
        .I3(op[0]),
        .I4(op[1]),
        .O(AluSrcB));
  LUT6 #(
    .INIT(64'h0000020000004000)) 
    DBDataSrc_INST_0
       (.I0(op[2]),
        .I1(op[1]),
        .I2(op[0]),
        .I3(op[5]),
        .I4(op[4]),
        .I5(op[3]),
        .O(DBDataSrc));
  LUT6 #(
    .INIT(64'hFDFFFFFFF7FFFFFF)) 
    ExtSel_INST_0
       (.I0(op[2]),
        .I1(op[3]),
        .I2(op[4]),
        .I3(op[5]),
        .I4(op[0]),
        .I5(op[1]),
        .O(ExtSel));
  LUT5 #(
    .INIT(32'h80006000)) 
    \PCSrc[0]_INST_0 
       (.I0(Zero),
        .I1(op[0]),
        .I2(op[2]),
        .I3(\PCSrc[0]_INST_0_i_1_n_0 ),
        .I4(op[1]),
        .O(PCSrc[0]));
  LUT3 #(
    .INIT(8'h01)) 
    \PCSrc[0]_INST_0_i_1 
       (.I0(op[4]),
        .I1(op[3]),
        .I2(op[5]),
        .O(\PCSrc[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \PCSrc[1]_INST_0 
       (.I0(op[5]),
        .I1(op[4]),
        .I2(op[0]),
        .I3(op[1]),
        .I4(op[3]),
        .I5(op[2]),
        .O(PCSrc[1]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    PCWre_INST_0
       (.I0(op[5]),
        .I1(op[4]),
        .I2(op[1]),
        .I3(op[0]),
        .I4(op[3]),
        .I5(op[2]),
        .O(PCWre));
  LUT6 #(
    .INIT(64'hFFFFFFF7FFFFFFFF)) 
    RD_INST_0
       (.I0(op[5]),
        .I1(op[1]),
        .I2(op[2]),
        .I3(op[3]),
        .I4(op[4]),
        .I5(op[0]),
        .O(RD));
  LUT6 #(
    .INIT(64'hFFF7FFF7FFE7FFFF)) 
    RegDst_INST_0
       (.I0(op[1]),
        .I1(op[0]),
        .I2(op[3]),
        .I3(op[4]),
        .I4(op[5]),
        .I5(op[2]),
        .O(RegDst));
  LUT6 #(
    .INIT(64'h7FFFFFF6FFFFBFF3)) 
    RegWre_INST_0
       (.I0(op[0]),
        .I1(op[2]),
        .I2(op[5]),
        .I3(op[3]),
        .I4(op[4]),
        .I5(op[1]),
        .O(RegWre));
  VCC VCC
       (.P(\<const1> ));
  LUT6 #(
    .INIT(64'hFFFFFFF7FFFFFFFF)) 
    WR_INST_0
       (.I0(op[5]),
        .I1(op[2]),
        .I2(op[1]),
        .I3(op[0]),
        .I4(op[4]),
        .I5(op[3]),
        .O(WR));
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
