// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Fri Nov 17 23:51:26 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_PC_0_0/design_1_PC_0_0_sim_netlist.v
// Design      : design_1_PC_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_PC_0_0,PC,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "PC,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module design_1_PC_0_0
   (CLK,
    Reset,
    Outputpc,
    Inputpc);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 Reset RST" *) input Reset;
  output [31:0]Outputpc;
  input [31:0]Inputpc;

  wire CLK;
  wire [31:0]Inputpc;
  wire [31:0]Outputpc;
  wire Reset;

  design_1_PC_0_0_PC inst
       (.CLK(CLK),
        .Inputpc(Inputpc),
        .Outputpc(Outputpc),
        .Reset(Reset));
endmodule

(* ORIG_REF_NAME = "PC" *) 
module design_1_PC_0_0_PC
   (Outputpc,
    Reset,
    Inputpc,
    CLK);
  output [31:0]Outputpc;
  input Reset;
  input [31:0]Inputpc;
  input CLK;

  wire CLK;
  wire [31:0]Inputpc;
  wire [31:0]Outputpc;
  wire \Outputpc[31]_i_1_n_0 ;
  wire Reset;

  LUT1 #(
    .INIT(2'h1)) 
    \Outputpc[31]_i_1 
       (.I0(Reset),
        .O(\Outputpc[31]_i_1_n_0 ));
  FDCE \Outputpc_reg[0] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[0]),
        .Q(Outputpc[0]));
  FDCE \Outputpc_reg[10] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[10]),
        .Q(Outputpc[10]));
  FDCE \Outputpc_reg[11] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[11]),
        .Q(Outputpc[11]));
  FDCE \Outputpc_reg[12] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[12]),
        .Q(Outputpc[12]));
  FDCE \Outputpc_reg[13] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[13]),
        .Q(Outputpc[13]));
  FDCE \Outputpc_reg[14] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[14]),
        .Q(Outputpc[14]));
  FDCE \Outputpc_reg[15] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[15]),
        .Q(Outputpc[15]));
  FDCE \Outputpc_reg[16] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[16]),
        .Q(Outputpc[16]));
  FDCE \Outputpc_reg[17] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[17]),
        .Q(Outputpc[17]));
  FDCE \Outputpc_reg[18] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[18]),
        .Q(Outputpc[18]));
  FDCE \Outputpc_reg[19] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[19]),
        .Q(Outputpc[19]));
  FDCE \Outputpc_reg[1] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[1]),
        .Q(Outputpc[1]));
  FDCE \Outputpc_reg[20] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[20]),
        .Q(Outputpc[20]));
  FDCE \Outputpc_reg[21] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[21]),
        .Q(Outputpc[21]));
  FDCE \Outputpc_reg[22] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[22]),
        .Q(Outputpc[22]));
  FDCE \Outputpc_reg[23] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[23]),
        .Q(Outputpc[23]));
  FDCE \Outputpc_reg[24] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[24]),
        .Q(Outputpc[24]));
  FDCE \Outputpc_reg[25] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[25]),
        .Q(Outputpc[25]));
  FDCE \Outputpc_reg[26] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[26]),
        .Q(Outputpc[26]));
  FDCE \Outputpc_reg[27] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[27]),
        .Q(Outputpc[27]));
  FDCE \Outputpc_reg[28] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[28]),
        .Q(Outputpc[28]));
  FDCE \Outputpc_reg[29] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[29]),
        .Q(Outputpc[29]));
  FDCE \Outputpc_reg[2] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[2]),
        .Q(Outputpc[2]));
  FDCE \Outputpc_reg[30] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[30]),
        .Q(Outputpc[30]));
  FDCE \Outputpc_reg[31] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[31]),
        .Q(Outputpc[31]));
  FDCE \Outputpc_reg[3] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[3]),
        .Q(Outputpc[3]));
  FDCE \Outputpc_reg[4] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[4]),
        .Q(Outputpc[4]));
  FDCE \Outputpc_reg[5] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[5]),
        .Q(Outputpc[5]));
  FDCE \Outputpc_reg[6] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[6]),
        .Q(Outputpc[6]));
  FDCE \Outputpc_reg[7] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[7]),
        .Q(Outputpc[7]));
  FDCE \Outputpc_reg[8] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[8]),
        .Q(Outputpc[8]));
  FDCE \Outputpc_reg[9] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Outputpc[31]_i_1_n_0 ),
        .D(Inputpc[9]),
        .Q(Outputpc[9]));
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
