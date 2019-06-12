// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Sun Nov 12 16:57:26 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_MuxForWriteReg_0_1/design_1_MuxForWriteReg_0_1_sim_netlist.v
// Design      : design_1_MuxForWriteReg_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_MuxForWriteReg_0_1,MuxForWriteReg,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "MuxForWriteReg,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module design_1_MuxForWriteReg_0_1
   (RegDst,
    rt,
    rd,
    Result);
  input RegDst;
  input [4:0]rt;
  input [4:0]rd;
  output [4:0]Result;

  wire RegDst;
  wire [4:0]Result;
  wire [4:0]rd;
  wire [4:0]rt;

  design_1_MuxForWriteReg_0_1_MuxForWriteReg inst
       (.RegDst(RegDst),
        .Result(Result),
        .rd(rd),
        .rt(rt));
endmodule

(* ORIG_REF_NAME = "MuxForWriteReg" *) 
module design_1_MuxForWriteReg_0_1_MuxForWriteReg
   (Result,
    rd,
    RegDst,
    rt);
  output [4:0]Result;
  input [4:0]rd;
  input RegDst;
  input [4:0]rt;

  wire RegDst;
  wire [4:0]Result;
  wire [4:0]rd;
  wire [4:0]rt;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Result[0]_INST_0 
       (.I0(rd[0]),
        .I1(RegDst),
        .I2(rt[0]),
        .O(Result[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Result[1]_INST_0 
       (.I0(rd[1]),
        .I1(RegDst),
        .I2(rt[1]),
        .O(Result[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Result[2]_INST_0 
       (.I0(rd[2]),
        .I1(RegDst),
        .I2(rt[2]),
        .O(Result[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Result[3]_INST_0 
       (.I0(rd[3]),
        .I1(RegDst),
        .I2(rt[3]),
        .O(Result[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    \Result[4]_INST_0 
       (.I0(rd[4]),
        .I1(RegDst),
        .I2(rt[4]),
        .O(Result[4]));
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
