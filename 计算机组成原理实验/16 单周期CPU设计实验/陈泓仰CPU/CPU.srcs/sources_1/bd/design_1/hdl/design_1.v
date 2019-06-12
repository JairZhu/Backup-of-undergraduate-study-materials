//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
//Date        : Sun Nov 19 17:12:45 2017
//Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=17,numReposBlks=17,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=17,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (CLK,
    Reset,
    Switch,
    a_to_g,
    clr,
    control,
    pos,
    rst);
  input CLK;
  input Reset;
  input Switch;
  output [6:0]a_to_g;
  input clr;
  input [1:0]control;
  output [3:0]pos;
  input rst;

  wire [31:0]ALU_0_Result;
  wire ALU_0_Sign;
  wire ALU_0_Zero;
  wire CLK_2;
  wire CLK_div1_0_CLK_1k;
  wire [2:0]ControlUnit_0_AluOp;
  wire ControlUnit_0_AluSrcA;
  wire ControlUnit_0_AluSrcB;
  wire ControlUnit_0_DBDataSrc;
  wire ControlUnit_0_ExtSel;
  wire ControlUnit_0_InsMemRW;
  wire [1:0]ControlUnit_0_PCSrc;
  wire ControlUnit_0_PCWre;
  wire ControlUnit_0_RD;
  wire ControlUnit_0_RegDst;
  wire ControlUnit_0_RegWre;
  wire ControlUnit_0_WR;
  wire [31:0]DataMem_0_DataOut;
  wire [15:0]DisplayControl_0_res;
  wire [25:0]InsMemory_0_AJshift;
  wire [15:0]InsMemory_0_immediate;
  wire [5:0]InsMemory_0_op;
  wire [4:0]InsMemory_0_rd;
  wire [4:0]InsMemory_0_rs;
  wire [4:0]InsMemory_0_rt;
  wire [4:0]InsMemory_0_sa;
  wire [31:0]MuxForReadData1_0_Result;
  wire [31:0]MuxForReadData2_0_Result;
  wire [31:0]MuxForWriteData_0_Result;
  wire [4:0]MuxForWriteReg_0_Result;
  wire [31:0]PC_Outputpc;
  wire [31:0]RegisterFile_0_ReadData1;
  wire [31:0]RegisterFile_0_ReadData2;
  wire Reset_1;
  wire [31:0]SignZeroExtend_0_OutData;
  wire Switch_1;
  wire [31:0]choose_0_Outputpc;
  wire clk_40hz_0_clk_40hz;
  wire clr_1;
  wire [1:0]control_1;
  wire rst_1;
  wire [6:0]x7seg_msg_0_a_to_g;
  wire [3:0]x7seg_msg_0_pos;

  assign CLK_2 = CLK;
  assign Reset_1 = Reset;
  assign Switch_1 = Switch;
  assign a_to_g[6:0] = x7seg_msg_0_a_to_g;
  assign clr_1 = clr;
  assign control_1 = control[1:0];
  assign pos[3:0] = x7seg_msg_0_pos;
  assign rst_1 = rst;
  design_1_ALU_0_0 ALU_0
       (.A(MuxForReadData1_0_Result),
        .AluOp(ControlUnit_0_AluOp),
        .B(MuxForReadData2_0_Result),
        .Result(ALU_0_Result),
        .Sign(ALU_0_Sign),
        .Zero(ALU_0_Zero));
  design_1_CLK_div1_0_0 CLK_div1_0
       (.CLK(CLK_2),
        .CLK_div(CLK_div1_0_CLK_1k),
        .clr(clr_1));
  design_1_ControlUnit_0_0 ControlUnit_0
       (.AluOp(ControlUnit_0_AluOp),
        .AluSrcA(ControlUnit_0_AluSrcA),
        .AluSrcB(ControlUnit_0_AluSrcB),
        .DBDataSrc(ControlUnit_0_DBDataSrc),
        .ExtSel(ControlUnit_0_ExtSel),
        .InsMemRW(ControlUnit_0_InsMemRW),
        .PCSrc(ControlUnit_0_PCSrc),
        .PCWre(ControlUnit_0_PCWre),
        .RD(ControlUnit_0_RD),
        .RegDst(ControlUnit_0_RegDst),
        .RegWre(ControlUnit_0_RegWre),
        .Sign(ALU_0_Sign),
        .WR(ControlUnit_0_WR),
        .Zero(ALU_0_Zero),
        .op(InsMemory_0_op));
  design_1_DataMem_0_0 DataMem_0
       (.CLK(Switch_1),
        .DataAddress(ALU_0_Result),
        .DataOut(DataMem_0_DataOut),
        .Datain(RegisterFile_0_ReadData2),
        .RD(ControlUnit_0_RD),
        .WR(ControlUnit_0_WR));
  design_1_DisplayControl_0_0 DisplayControl_0
       (.AluResult(ALU_0_Result),
        .DbResult(DataMem_0_DataOut),
        .NextPC(choose_0_Outputpc),
        .NowPC(PC_Outputpc),
        .RsAddr(InsMemory_0_rs),
        .RsData(RegisterFile_0_ReadData1),
        .RtAddr(InsMemory_0_rt),
        .RtData(RegisterFile_0_ReadData2),
        .control(control_1),
        .res(DisplayControl_0_res));
  design_1_InsMemory_0_0 InsMemory_0
       (.AJshift(InsMemory_0_AJshift),
        .IAddress(PC_Outputpc),
        .InsMemRW(ControlUnit_0_InsMemRW),
        .immediate(InsMemory_0_immediate),
        .op(InsMemory_0_op),
        .rd(InsMemory_0_rd),
        .rs(InsMemory_0_rs),
        .rt(InsMemory_0_rt),
        .sa(InsMemory_0_sa));
  design_1_MuxForReadData1_0_0 MuxForReadData1_0
       (.AluSrcA(ControlUnit_0_AluSrcA),
        .Data(RegisterFile_0_ReadData1),
        .Result(MuxForReadData1_0_Result),
        .Sa(InsMemory_0_sa));
  design_1_MuxForReadData2_0_0 MuxForReadData2_0
       (.AluSrcB(ControlUnit_0_AluSrcB),
        .Data2(RegisterFile_0_ReadData2),
        .ExtendResult(SignZeroExtend_0_OutData),
        .Result(MuxForReadData2_0_Result));
  design_1_MuxForWriteData_0_0 MuxForWriteData_0
       (.AluData(ALU_0_Result),
        .DBDataSrc(ControlUnit_0_DBDataSrc),
        .MemData(DataMem_0_DataOut),
        .Result(MuxForWriteData_0_Result));
  design_1_MuxForWriteReg_0_1 MuxForWriteReg_0
       (.RegDst(ControlUnit_0_RegDst),
        .Result(MuxForWriteReg_0_Result),
        .rd(InsMemory_0_rd),
        .rt(InsMemory_0_rt));
  design_1_PC_0_0 PC
       (.CLK(Switch_1),
        .Inputpc(choose_0_Outputpc),
        .Outputpc(PC_Outputpc),
        .Reset(Reset_1));
  design_1_RegisterFile_0_1 RegisterFile_0
       (.CLK(Switch_1),
        .ReadData1(RegisterFile_0_ReadData1),
        .ReadData2(RegisterFile_0_ReadData2),
        .ReadReg1(InsMemory_0_rs),
        .ReadReg2(InsMemory_0_rt),
        .RegWre(ControlUnit_0_RegWre),
        .Reset(rst_1),
        .WriteData(MuxForWriteData_0_Result),
        .WriteReg(MuxForWriteReg_0_Result));
  design_1_SignZeroExtend_0_0 SignZeroExtend_0
       (.ExtSel(ControlUnit_0_ExtSel),
        .InData(InsMemory_0_immediate),
        .OutData(SignZeroExtend_0_OutData));
  design_1_avoidshake_0_0 avoidshake_0
       (.BJ_CLK(clk_40hz_0_clk_40hz),
        .BUTTON_IN(1'b0));
  design_1_choose_0_0 choose_0
       (.AJshift(InsMemory_0_AJshift),
        .Immediate(SignZeroExtend_0_OutData),
        .Inputpc(PC_Outputpc),
        .Outputpc(choose_0_Outputpc),
        .PCSrc(ControlUnit_0_PCSrc),
        .PCWre(ControlUnit_0_PCWre));
  design_1_clk_40hz_0_0 clk_40hz_0
       (.CLK(CLK_2),
        .clk_40hz(clk_40hz_0_clk_40hz),
        .clr(clr_1));
  design_1_x7seg_msg_0_0 x7seg_msg_0
       (.CLK_div(CLK_div1_0_CLK_1k),
        .a_to_g(x7seg_msg_0_a_to_g),
        .clr(clr_1),
        .pos(x7seg_msg_0_pos),
        .res(DisplayControl_0_res));
endmodule
