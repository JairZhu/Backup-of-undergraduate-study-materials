// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Sun Nov 12 21:13:09 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_MuxForWriteData_0_0_sim_netlist.v
// Design      : design_1_MuxForWriteData_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_MuxForWriteData
   (Result,
    MemData,
    AluData,
    DBDataSrc);
  output [31:0]Result;
  input [31:0]MemData;
  input [31:0]AluData;
  input DBDataSrc;

  wire [31:0]AluData;
  wire DBDataSrc;
  wire [31:0]MemData;
  wire [31:0]Result;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[0]_INST_0 
       (.I0(MemData[0]),
        .I1(AluData[0]),
        .I2(DBDataSrc),
        .O(Result[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[10]_INST_0 
       (.I0(MemData[10]),
        .I1(AluData[10]),
        .I2(DBDataSrc),
        .O(Result[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[11]_INST_0 
       (.I0(MemData[11]),
        .I1(AluData[11]),
        .I2(DBDataSrc),
        .O(Result[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[12]_INST_0 
       (.I0(MemData[12]),
        .I1(AluData[12]),
        .I2(DBDataSrc),
        .O(Result[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[13]_INST_0 
       (.I0(MemData[13]),
        .I1(AluData[13]),
        .I2(DBDataSrc),
        .O(Result[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[14]_INST_0 
       (.I0(MemData[14]),
        .I1(AluData[14]),
        .I2(DBDataSrc),
        .O(Result[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[15]_INST_0 
       (.I0(MemData[15]),
        .I1(AluData[15]),
        .I2(DBDataSrc),
        .O(Result[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[16]_INST_0 
       (.I0(MemData[16]),
        .I1(AluData[16]),
        .I2(DBDataSrc),
        .O(Result[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[17]_INST_0 
       (.I0(MemData[17]),
        .I1(AluData[17]),
        .I2(DBDataSrc),
        .O(Result[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[18]_INST_0 
       (.I0(MemData[18]),
        .I1(AluData[18]),
        .I2(DBDataSrc),
        .O(Result[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[19]_INST_0 
       (.I0(MemData[19]),
        .I1(AluData[19]),
        .I2(DBDataSrc),
        .O(Result[19]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[1]_INST_0 
       (.I0(MemData[1]),
        .I1(AluData[1]),
        .I2(DBDataSrc),
        .O(Result[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[20]_INST_0 
       (.I0(MemData[20]),
        .I1(AluData[20]),
        .I2(DBDataSrc),
        .O(Result[20]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[21]_INST_0 
       (.I0(MemData[21]),
        .I1(AluData[21]),
        .I2(DBDataSrc),
        .O(Result[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[22]_INST_0 
       (.I0(MemData[22]),
        .I1(AluData[22]),
        .I2(DBDataSrc),
        .O(Result[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[23]_INST_0 
       (.I0(MemData[23]),
        .I1(AluData[23]),
        .I2(DBDataSrc),
        .O(Result[23]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[24]_INST_0 
       (.I0(MemData[24]),
        .I1(AluData[24]),
        .I2(DBDataSrc),
        .O(Result[24]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[25]_INST_0 
       (.I0(MemData[25]),
        .I1(AluData[25]),
        .I2(DBDataSrc),
        .O(Result[25]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[26]_INST_0 
       (.I0(MemData[26]),
        .I1(AluData[26]),
        .I2(DBDataSrc),
        .O(Result[26]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[27]_INST_0 
       (.I0(MemData[27]),
        .I1(AluData[27]),
        .I2(DBDataSrc),
        .O(Result[27]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[28]_INST_0 
       (.I0(MemData[28]),
        .I1(AluData[28]),
        .I2(DBDataSrc),
        .O(Result[28]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[29]_INST_0 
       (.I0(MemData[29]),
        .I1(AluData[29]),
        .I2(DBDataSrc),
        .O(Result[29]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[2]_INST_0 
       (.I0(MemData[2]),
        .I1(AluData[2]),
        .I2(DBDataSrc),
        .O(Result[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[30]_INST_0 
       (.I0(MemData[30]),
        .I1(AluData[30]),
        .I2(DBDataSrc),
        .O(Result[30]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[31]_INST_0 
       (.I0(MemData[31]),
        .I1(AluData[31]),
        .I2(DBDataSrc),
        .O(Result[31]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[3]_INST_0 
       (.I0(MemData[3]),
        .I1(AluData[3]),
        .I2(DBDataSrc),
        .O(Result[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[4]_INST_0 
       (.I0(MemData[4]),
        .I1(AluData[4]),
        .I2(DBDataSrc),
        .O(Result[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[5]_INST_0 
       (.I0(MemData[5]),
        .I1(AluData[5]),
        .I2(DBDataSrc),
        .O(Result[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[6]_INST_0 
       (.I0(MemData[6]),
        .I1(AluData[6]),
        .I2(DBDataSrc),
        .O(Result[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[7]_INST_0 
       (.I0(MemData[7]),
        .I1(AluData[7]),
        .I2(DBDataSrc),
        .O(Result[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[8]_INST_0 
       (.I0(MemData[8]),
        .I1(AluData[8]),
        .I2(DBDataSrc),
        .O(Result[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Result[9]_INST_0 
       (.I0(MemData[9]),
        .I1(AluData[9]),
        .I2(DBDataSrc),
        .O(Result[9]));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_MuxForWriteData_0_0,MuxForWriteData,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "MuxForWriteData,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (DBDataSrc,
    AluData,
    MemData,
    Result);
  input DBDataSrc;
  input [31:0]AluData;
  input [31:0]MemData;
  output [31:0]Result;

  wire [31:0]AluData;
  wire DBDataSrc;
  wire [31:0]MemData;
  wire [31:0]Result;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_MuxForWriteData inst
       (.AluData(AluData),
        .DBDataSrc(DBDataSrc),
        .MemData(MemData),
        .Result(Result));
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
