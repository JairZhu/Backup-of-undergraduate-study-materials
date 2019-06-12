// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Sun Nov 12 16:56:47 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_MuxForReadData2_0_0/design_1_MuxForReadData2_0_0_sim_netlist.v
// Design      : design_1_MuxForReadData2_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_MuxForReadData2_0_0,MuxForReadData2,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "MuxForReadData2,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module design_1_MuxForReadData2_0_0
   (AluSrcB,
    Data2,
    ExtendResult,
    Result);
  input AluSrcB;
  input [31:0]Data2;
  input [31:0]ExtendResult;
  output [31:0]Result;

  wire AluSrcB;
  wire [31:0]Data2;
  wire [31:0]ExtendResult;
  wire [31:0]Result;

  design_1_MuxForReadData2_0_0_MuxForReadData2 inst
       (.AluSrcB(AluSrcB),
        .Data2(Data2),
        .ExtendResult(ExtendResult),
        .Result(Result));
endmodule

(* ORIG_REF_NAME = "MuxForReadData2" *) 
module design_1_MuxForReadData2_0_0_MuxForReadData2
   (Result,
    ExtendResult,
    Data2,
    AluSrcB);
  output [31:0]Result;
  input [31:0]ExtendResult;
  input [31:0]Data2;
  input AluSrcB;

  wire AluSrcB;
  wire [31:0]Data2;
  wire [31:0]ExtendResult;
  wire [31:0]Result;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[0]_INST_0 
       (.I0(ExtendResult[0]),
        .I1(Data2[0]),
        .I2(AluSrcB),
        .O(Result[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[10]_INST_0 
       (.I0(ExtendResult[10]),
        .I1(Data2[10]),
        .I2(AluSrcB),
        .O(Result[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[11]_INST_0 
       (.I0(ExtendResult[11]),
        .I1(Data2[11]),
        .I2(AluSrcB),
        .O(Result[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[12]_INST_0 
       (.I0(ExtendResult[12]),
        .I1(Data2[12]),
        .I2(AluSrcB),
        .O(Result[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[13]_INST_0 
       (.I0(ExtendResult[13]),
        .I1(Data2[13]),
        .I2(AluSrcB),
        .O(Result[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[14]_INST_0 
       (.I0(ExtendResult[14]),
        .I1(Data2[14]),
        .I2(AluSrcB),
        .O(Result[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[15]_INST_0 
       (.I0(ExtendResult[15]),
        .I1(Data2[15]),
        .I2(AluSrcB),
        .O(Result[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[16]_INST_0 
       (.I0(ExtendResult[16]),
        .I1(Data2[16]),
        .I2(AluSrcB),
        .O(Result[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[17]_INST_0 
       (.I0(ExtendResult[17]),
        .I1(Data2[17]),
        .I2(AluSrcB),
        .O(Result[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[18]_INST_0 
       (.I0(ExtendResult[18]),
        .I1(Data2[18]),
        .I2(AluSrcB),
        .O(Result[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[19]_INST_0 
       (.I0(ExtendResult[19]),
        .I1(Data2[19]),
        .I2(AluSrcB),
        .O(Result[19]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[1]_INST_0 
       (.I0(ExtendResult[1]),
        .I1(Data2[1]),
        .I2(AluSrcB),
        .O(Result[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[20]_INST_0 
       (.I0(ExtendResult[20]),
        .I1(Data2[20]),
        .I2(AluSrcB),
        .O(Result[20]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[21]_INST_0 
       (.I0(ExtendResult[21]),
        .I1(Data2[21]),
        .I2(AluSrcB),
        .O(Result[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[22]_INST_0 
       (.I0(ExtendResult[22]),
        .I1(Data2[22]),
        .I2(AluSrcB),
        .O(Result[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[23]_INST_0 
       (.I0(ExtendResult[23]),
        .I1(Data2[23]),
        .I2(AluSrcB),
        .O(Result[23]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[24]_INST_0 
       (.I0(ExtendResult[24]),
        .I1(Data2[24]),
        .I2(AluSrcB),
        .O(Result[24]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[25]_INST_0 
       (.I0(ExtendResult[25]),
        .I1(Data2[25]),
        .I2(AluSrcB),
        .O(Result[25]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[26]_INST_0 
       (.I0(ExtendResult[26]),
        .I1(Data2[26]),
        .I2(AluSrcB),
        .O(Result[26]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[27]_INST_0 
       (.I0(ExtendResult[27]),
        .I1(Data2[27]),
        .I2(AluSrcB),
        .O(Result[27]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[28]_INST_0 
       (.I0(ExtendResult[28]),
        .I1(Data2[28]),
        .I2(AluSrcB),
        .O(Result[28]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[29]_INST_0 
       (.I0(ExtendResult[29]),
        .I1(Data2[29]),
        .I2(AluSrcB),
        .O(Result[29]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[2]_INST_0 
       (.I0(ExtendResult[2]),
        .I1(Data2[2]),
        .I2(AluSrcB),
        .O(Result[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[30]_INST_0 
       (.I0(ExtendResult[30]),
        .I1(Data2[30]),
        .I2(AluSrcB),
        .O(Result[30]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[31]_INST_0 
       (.I0(ExtendResult[31]),
        .I1(Data2[31]),
        .I2(AluSrcB),
        .O(Result[31]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[3]_INST_0 
       (.I0(ExtendResult[3]),
        .I1(Data2[3]),
        .I2(AluSrcB),
        .O(Result[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[4]_INST_0 
       (.I0(ExtendResult[4]),
        .I1(Data2[4]),
        .I2(AluSrcB),
        .O(Result[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[5]_INST_0 
       (.I0(ExtendResult[5]),
        .I1(Data2[5]),
        .I2(AluSrcB),
        .O(Result[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[6]_INST_0 
       (.I0(ExtendResult[6]),
        .I1(Data2[6]),
        .I2(AluSrcB),
        .O(Result[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[7]_INST_0 
       (.I0(ExtendResult[7]),
        .I1(Data2[7]),
        .I2(AluSrcB),
        .O(Result[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[8]_INST_0 
       (.I0(ExtendResult[8]),
        .I1(Data2[8]),
        .I2(AluSrcB),
        .O(Result[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[9]_INST_0 
       (.I0(ExtendResult[9]),
        .I1(Data2[9]),
        .I2(AluSrcB),
        .O(Result[9]));
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
