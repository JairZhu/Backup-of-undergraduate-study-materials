// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Sat Nov 18 00:36:26 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_avoidshake_0_0_sim_netlist.v
// Design      : design_1_avoidshake_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_avoidshake
   (BUTTON_OUT,
    BUTTON_IN,
    BJ_CLK);
  output BUTTON_OUT;
  input BUTTON_IN;
  input BJ_CLK;

  wire BJ_CLK;
  wire BUTTON_IN;
  wire BUTTON_IN_2Q;
  wire BUTTON_IN_3Q;
  wire BUTTON_IN_Q;
  wire BUTTON_OUT;

  FDRE BUTTON_IN_2Q_reg
       (.C(BJ_CLK),
        .CE(1'b1),
        .D(BUTTON_IN_Q),
        .Q(BUTTON_IN_2Q),
        .R(1'b0));
  FDRE BUTTON_IN_3Q_reg
       (.C(BJ_CLK),
        .CE(1'b1),
        .D(BUTTON_IN_2Q),
        .Q(BUTTON_IN_3Q),
        .R(1'b0));
  FDRE BUTTON_IN_Q_reg
       (.C(BJ_CLK),
        .CE(1'b1),
        .D(BUTTON_IN),
        .Q(BUTTON_IN_Q),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    BUTTON_OUT_INST_0
       (.I0(BUTTON_IN_2Q),
        .I1(BUTTON_IN_3Q),
        .O(BUTTON_OUT));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_avoidshake_0_0,avoidshake,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "avoidshake,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (BJ_CLK,
    BUTTON_IN,
    BUTTON_OUT);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 BJ_CLK CLK" *) input BJ_CLK;
  input BUTTON_IN;
  output BUTTON_OUT;

  wire BJ_CLK;
  wire BUTTON_IN;
  wire BUTTON_OUT;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_avoidshake inst
       (.BJ_CLK(BJ_CLK),
        .BUTTON_IN(BUTTON_IN),
        .BUTTON_OUT(BUTTON_OUT));
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
