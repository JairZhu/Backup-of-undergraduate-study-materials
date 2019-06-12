// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Fri Nov 17 11:14:34 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_x7seg_msg_0_0_sim_netlist.v
// Design      : design_1_x7seg_msg_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_x7seg_msg_0_0,x7seg_msg,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "x7seg_msg,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK_div,
    clr,
    res,
    a_to_g,
    pos);
  input CLK_div;
  input clr;
  input [15:0]res;
  output [6:0]a_to_g;
  output [3:0]pos;

  wire CLK_div;
  wire [6:0]a_to_g;
  wire clr;
  wire [3:0]pos;
  wire [15:0]res;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_x7seg_msg inst
       (.CLK_div(CLK_div),
        .a_to_g(a_to_g),
        .clr(clr),
        .pos(pos),
        .res(res));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_x7seg_msg
   (pos,
    a_to_g,
    clr,
    CLK_div,
    res);
  output [3:0]pos;
  output [6:0]a_to_g;
  input clr;
  input CLK_div;
  input [15:0]res;

  wire CLK_div;
  wire [6:0]a_to_g;
  wire clr;
  wire [3:0]digit__11;
  wire [3:0]pos;
  wire [15:0]res;
  wire [1:0]s;
  wire \s[0]_i_1_n_0 ;
  wire \s[1]_i_1_n_0 ;

  LUT4 #(
    .INIT(16'h4025)) 
    \a_to_g[0]_INST_0 
       (.I0(digit__11[3]),
        .I1(digit__11[0]),
        .I2(digit__11[2]),
        .I3(digit__11[1]),
        .O(a_to_g[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h5190)) 
    \a_to_g[1]_INST_0 
       (.I0(digit__11[3]),
        .I1(digit__11[2]),
        .I2(digit__11[0]),
        .I3(digit__11[1]),
        .O(a_to_g[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h5710)) 
    \a_to_g[2]_INST_0 
       (.I0(digit__11[3]),
        .I1(digit__11[1]),
        .I2(digit__11[2]),
        .I3(digit__11[0]),
        .O(a_to_g[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hC214)) 
    \a_to_g[3]_INST_0 
       (.I0(digit__11[3]),
        .I1(digit__11[2]),
        .I2(digit__11[0]),
        .I3(digit__11[1]),
        .O(a_to_g[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hA210)) 
    \a_to_g[4]_INST_0 
       (.I0(digit__11[3]),
        .I1(digit__11[0]),
        .I2(digit__11[1]),
        .I3(digit__11[2]),
        .O(a_to_g[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hAC48)) 
    \a_to_g[5]_INST_0 
       (.I0(digit__11[3]),
        .I1(digit__11[2]),
        .I2(digit__11[0]),
        .I3(digit__11[1]),
        .O(a_to_g[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2094)) 
    \a_to_g[6]_INST_0 
       (.I0(digit__11[3]),
        .I1(digit__11[2]),
        .I2(digit__11[0]),
        .I3(digit__11[1]),
        .O(a_to_g[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \a_to_g[6]_INST_0_i_1 
       (.I0(res[15]),
        .I1(res[7]),
        .I2(s[0]),
        .I3(res[11]),
        .I4(s[1]),
        .I5(res[3]),
        .O(digit__11[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \a_to_g[6]_INST_0_i_2 
       (.I0(res[14]),
        .I1(res[6]),
        .I2(s[0]),
        .I3(res[10]),
        .I4(s[1]),
        .I5(res[2]),
        .O(digit__11[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \a_to_g[6]_INST_0_i_3 
       (.I0(res[12]),
        .I1(res[4]),
        .I2(s[0]),
        .I3(res[8]),
        .I4(s[1]),
        .I5(res[0]),
        .O(digit__11[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \a_to_g[6]_INST_0_i_4 
       (.I0(res[13]),
        .I1(res[5]),
        .I2(s[0]),
        .I3(res[9]),
        .I4(s[1]),
        .I5(res[1]),
        .O(digit__11[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \pos[0]_INST_0 
       (.I0(clr),
        .I1(s[0]),
        .I2(s[1]),
        .O(pos[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \pos[1]_INST_0 
       (.I0(clr),
        .I1(s[1]),
        .I2(s[0]),
        .O(pos[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \pos[2]_INST_0 
       (.I0(clr),
        .I1(s[0]),
        .I2(s[1]),
        .O(pos[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \pos[3]_INST_0 
       (.I0(clr),
        .I1(s[0]),
        .I2(s[1]),
        .O(pos[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \s[0]_i_1 
       (.I0(s[0]),
        .O(\s[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \s[1]_i_1 
       (.I0(s[1]),
        .I1(s[0]),
        .O(\s[1]_i_1_n_0 ));
  FDCE \s_reg[0] 
       (.C(CLK_div),
        .CE(1'b1),
        .CLR(clr),
        .D(\s[0]_i_1_n_0 ),
        .Q(s[0]));
  FDCE \s_reg[1] 
       (.C(CLK_div),
        .CE(1'b1),
        .CLR(clr),
        .D(\s[1]_i_1_n_0 ),
        .Q(s[1]));
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
