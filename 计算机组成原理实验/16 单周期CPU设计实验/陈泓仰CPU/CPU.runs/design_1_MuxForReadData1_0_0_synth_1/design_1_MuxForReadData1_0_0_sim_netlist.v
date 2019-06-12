// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Sun Nov 12 16:55:58 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_MuxForReadData1_0_0_sim_netlist.v
// Design      : design_1_MuxForReadData1_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_MuxForReadData1
   (Result,
    Sa,
    Data,
    AluSrcA);
  output [31:0]Result;
  input [4:0]Sa;
  input [31:0]Data;
  input AluSrcA;

  wire AluSrcA;
  wire [31:0]Data;
  wire [31:0]Result;
  wire [4:0]Sa;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[0]_INST_0 
       (.I0(Sa[0]),
        .I1(Data[0]),
        .I2(AluSrcA),
        .O(Result[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[10]_INST_0 
       (.I0(Data[10]),
        .I1(AluSrcA),
        .O(Result[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[11]_INST_0 
       (.I0(Data[11]),
        .I1(AluSrcA),
        .O(Result[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[12]_INST_0 
       (.I0(Data[12]),
        .I1(AluSrcA),
        .O(Result[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[13]_INST_0 
       (.I0(Data[13]),
        .I1(AluSrcA),
        .O(Result[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[14]_INST_0 
       (.I0(Data[14]),
        .I1(AluSrcA),
        .O(Result[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[15]_INST_0 
       (.I0(Data[15]),
        .I1(AluSrcA),
        .O(Result[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[16]_INST_0 
       (.I0(Data[16]),
        .I1(AluSrcA),
        .O(Result[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[17]_INST_0 
       (.I0(Data[17]),
        .I1(AluSrcA),
        .O(Result[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[18]_INST_0 
       (.I0(Data[18]),
        .I1(AluSrcA),
        .O(Result[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[19]_INST_0 
       (.I0(Data[19]),
        .I1(AluSrcA),
        .O(Result[19]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[1]_INST_0 
       (.I0(Sa[1]),
        .I1(Data[1]),
        .I2(AluSrcA),
        .O(Result[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[20]_INST_0 
       (.I0(Data[20]),
        .I1(AluSrcA),
        .O(Result[20]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[21]_INST_0 
       (.I0(Data[21]),
        .I1(AluSrcA),
        .O(Result[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[22]_INST_0 
       (.I0(Data[22]),
        .I1(AluSrcA),
        .O(Result[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[23]_INST_0 
       (.I0(Data[23]),
        .I1(AluSrcA),
        .O(Result[23]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[24]_INST_0 
       (.I0(Data[24]),
        .I1(AluSrcA),
        .O(Result[24]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[25]_INST_0 
       (.I0(Data[25]),
        .I1(AluSrcA),
        .O(Result[25]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[26]_INST_0 
       (.I0(Data[26]),
        .I1(AluSrcA),
        .O(Result[26]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[27]_INST_0 
       (.I0(Data[27]),
        .I1(AluSrcA),
        .O(Result[27]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[28]_INST_0 
       (.I0(Data[28]),
        .I1(AluSrcA),
        .O(Result[28]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[29]_INST_0 
       (.I0(Data[29]),
        .I1(AluSrcA),
        .O(Result[29]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[2]_INST_0 
       (.I0(Sa[2]),
        .I1(Data[2]),
        .I2(AluSrcA),
        .O(Result[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[30]_INST_0 
       (.I0(Data[30]),
        .I1(AluSrcA),
        .O(Result[30]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[31]_INST_0 
       (.I0(Data[31]),
        .I1(AluSrcA),
        .O(Result[31]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[3]_INST_0 
       (.I0(Sa[3]),
        .I1(Data[3]),
        .I2(AluSrcA),
        .O(Result[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[4]_INST_0 
       (.I0(Sa[4]),
        .I1(Data[4]),
        .I2(AluSrcA),
        .O(Result[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[5]_INST_0 
       (.I0(Data[5]),
        .I1(AluSrcA),
        .O(Result[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[6]_INST_0 
       (.I0(Data[6]),
        .I1(AluSrcA),
        .O(Result[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[7]_INST_0 
       (.I0(Data[7]),
        .I1(AluSrcA),
        .O(Result[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[8]_INST_0 
       (.I0(Data[8]),
        .I1(AluSrcA),
        .O(Result[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Result[9]_INST_0 
       (.I0(Data[9]),
        .I1(AluSrcA),
        .O(Result[9]));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_MuxForReadData1_0_0,MuxForReadData1,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "MuxForReadData1,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (AluSrcA,
    Data,
    Sa,
    Result);
  input AluSrcA;
  input [31:0]Data;
  input [4:0]Sa;
  output [31:0]Result;

  wire AluSrcA;
  wire [31:0]Data;
  wire [31:0]Result;
  wire [4:0]Sa;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_MuxForReadData1 inst
       (.AluSrcA(AluSrcA),
        .Data(Data),
        .Result(Result),
        .Sa(Sa));
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
