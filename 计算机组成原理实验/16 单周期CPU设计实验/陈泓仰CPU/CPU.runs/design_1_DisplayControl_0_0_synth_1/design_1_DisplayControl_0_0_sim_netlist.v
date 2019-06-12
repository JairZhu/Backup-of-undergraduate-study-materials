// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Fri Nov 17 23:51:26 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_DisplayControl_0_0_sim_netlist.v
// Design      : design_1_DisplayControl_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_DisplayControl
   (res,
    DbResult,
    RsData,
    RtData,
    control,
    NextPC,
    AluResult,
    RsAddr,
    RtAddr,
    NowPC);
  output [15:0]res;
  input [7:0]DbResult;
  input [7:0]RsData;
  input [7:0]RtData;
  input [1:0]control;
  input [7:0]NextPC;
  input [7:0]AluResult;
  input [4:0]RsAddr;
  input [4:0]RtAddr;
  input [7:0]NowPC;

  wire [7:0]AluResult;
  wire [7:0]DbResult;
  wire [7:0]NextPC;
  wire [7:0]NowPC;
  wire [4:0]RsAddr;
  wire [7:0]RsData;
  wire [4:0]RtAddr;
  wire [7:0]RtData;
  wire [1:0]control;
  wire [15:0]res;

  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \res[0]_INST_0 
       (.I0(DbResult[0]),
        .I1(RsData[0]),
        .I2(RtData[0]),
        .I3(control[1]),
        .I4(NextPC[0]),
        .I5(control[0]),
        .O(res[0]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \res[10]_INST_0 
       (.I0(AluResult[2]),
        .I1(RsAddr[2]),
        .I2(RtAddr[2]),
        .I3(control[1]),
        .I4(NowPC[2]),
        .I5(control[0]),
        .O(res[10]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \res[11]_INST_0 
       (.I0(AluResult[3]),
        .I1(RsAddr[3]),
        .I2(RtAddr[3]),
        .I3(control[1]),
        .I4(NowPC[3]),
        .I5(control[0]),
        .O(res[11]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \res[12]_INST_0 
       (.I0(AluResult[4]),
        .I1(RsAddr[4]),
        .I2(RtAddr[4]),
        .I3(control[1]),
        .I4(NowPC[4]),
        .I5(control[0]),
        .O(res[12]));
  LUT4 #(
    .INIT(16'h8830)) 
    \res[13]_INST_0 
       (.I0(AluResult[5]),
        .I1(control[0]),
        .I2(NowPC[5]),
        .I3(control[1]),
        .O(res[13]));
  LUT4 #(
    .INIT(16'h8830)) 
    \res[14]_INST_0 
       (.I0(AluResult[6]),
        .I1(control[0]),
        .I2(NowPC[6]),
        .I3(control[1]),
        .O(res[14]));
  LUT4 #(
    .INIT(16'h8830)) 
    \res[15]_INST_0 
       (.I0(AluResult[7]),
        .I1(control[0]),
        .I2(NowPC[7]),
        .I3(control[1]),
        .O(res[15]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \res[1]_INST_0 
       (.I0(DbResult[1]),
        .I1(RsData[1]),
        .I2(RtData[1]),
        .I3(control[1]),
        .I4(NextPC[1]),
        .I5(control[0]),
        .O(res[1]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \res[2]_INST_0 
       (.I0(DbResult[2]),
        .I1(RsData[2]),
        .I2(RtData[2]),
        .I3(control[1]),
        .I4(NextPC[2]),
        .I5(control[0]),
        .O(res[2]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \res[3]_INST_0 
       (.I0(DbResult[3]),
        .I1(RsData[3]),
        .I2(RtData[3]),
        .I3(control[1]),
        .I4(NextPC[3]),
        .I5(control[0]),
        .O(res[3]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \res[4]_INST_0 
       (.I0(DbResult[4]),
        .I1(RsData[4]),
        .I2(RtData[4]),
        .I3(control[1]),
        .I4(NextPC[4]),
        .I5(control[0]),
        .O(res[4]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \res[5]_INST_0 
       (.I0(DbResult[5]),
        .I1(RsData[5]),
        .I2(RtData[5]),
        .I3(control[1]),
        .I4(NextPC[5]),
        .I5(control[0]),
        .O(res[5]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \res[6]_INST_0 
       (.I0(DbResult[6]),
        .I1(RsData[6]),
        .I2(RtData[6]),
        .I3(control[1]),
        .I4(NextPC[6]),
        .I5(control[0]),
        .O(res[6]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \res[7]_INST_0 
       (.I0(DbResult[7]),
        .I1(RsData[7]),
        .I2(RtData[7]),
        .I3(control[1]),
        .I4(NextPC[7]),
        .I5(control[0]),
        .O(res[7]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \res[8]_INST_0 
       (.I0(AluResult[0]),
        .I1(RsAddr[0]),
        .I2(RtAddr[0]),
        .I3(control[1]),
        .I4(NowPC[0]),
        .I5(control[0]),
        .O(res[8]));
  LUT6 #(
    .INIT(64'hAACCAACCF0FFF000)) 
    \res[9]_INST_0 
       (.I0(AluResult[1]),
        .I1(RsAddr[1]),
        .I2(RtAddr[1]),
        .I3(control[1]),
        .I4(NowPC[1]),
        .I5(control[0]),
        .O(res[9]));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_DisplayControl_0_0,DisplayControl,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "DisplayControl,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (NowPC,
    NextPC,
    RsAddr,
    RsData,
    RtAddr,
    RtData,
    AluResult,
    DbResult,
    control,
    res);
  input [31:0]NowPC;
  input [31:0]NextPC;
  input [4:0]RsAddr;
  input [31:0]RsData;
  input [4:0]RtAddr;
  input [31:0]RtData;
  input [31:0]AluResult;
  input [31:0]DbResult;
  input [1:0]control;
  output [15:0]res;

  wire [31:0]AluResult;
  wire [31:0]DbResult;
  wire [31:0]NextPC;
  wire [31:0]NowPC;
  wire [4:0]RsAddr;
  wire [31:0]RsData;
  wire [4:0]RtAddr;
  wire [31:0]RtData;
  wire [1:0]control;
  wire [15:0]res;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_DisplayControl inst
       (.AluResult(AluResult[7:0]),
        .DbResult(DbResult[7:0]),
        .NextPC(NextPC[7:0]),
        .NowPC(NowPC[7:0]),
        .RsAddr(RsAddr),
        .RsData(RsData[7:0]),
        .RtAddr(RtAddr),
        .RtData(RtData[7:0]),
        .control(control),
        .res(res));
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
