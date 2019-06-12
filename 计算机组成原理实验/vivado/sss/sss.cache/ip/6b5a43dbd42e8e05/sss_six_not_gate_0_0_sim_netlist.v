// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Wed May 17 00:31:06 2017
// Host        : surface running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ sss_six_not_gate_0_0_sim_netlist.v
// Design      : sss_six_not_gate_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sss_six_not_gate_0_0,six_not_gate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "six_not_gate,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A1,
    A2,
    A3,
    A4,
    A5,
    A6,
    Y1,
    Y2,
    Y3,
    Y4,
    Y5,
    Y6);
  input A1;
  input A2;
  input A3;
  input A4;
  input A5;
  input A6;
  output Y1;
  output Y2;
  output Y3;
  output Y4;
  output Y5;
  output Y6;

  wire A1;
  wire A2;
  wire A3;
  wire A4;
  wire A5;
  wire A6;
  wire Y1;
  wire Y2;
  wire Y3;
  wire Y4;
  wire Y5;
  wire Y6;

  LUT1 #(
    .INIT(2'h1)) 
    Y1_INST_0
       (.I0(A1),
        .O(Y1));
  LUT1 #(
    .INIT(2'h1)) 
    Y2_INST_0
       (.I0(A2),
        .O(Y2));
  LUT1 #(
    .INIT(2'h1)) 
    Y3_INST_0
       (.I0(A3),
        .O(Y3));
  LUT1 #(
    .INIT(2'h1)) 
    Y4_INST_0
       (.I0(A4),
        .O(Y4));
  LUT1 #(
    .INIT(2'h1)) 
    Y5_INST_0
       (.I0(A5),
        .O(Y5));
  LUT1 #(
    .INIT(2'h1)) 
    Y6_INST_0
       (.I0(A6),
        .O(Y6));
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
