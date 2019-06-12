`timescale 1ns / 1ps

module single_cycle_CPU(
    input CLK, PCreset, RST  //RSTÀ´×ÔRegFile
    //output wire [7:0] curPC_low, nextPC_low, RSaddr, RSdata, RTaddr, RTdata, ALUresult, dbdata 
    );
    wire [31:0] nextPC;
    wire pcwre;
    wire [31:0] pcout;
    wire [31:0] pc4;
    wire [31:0] imm;
    wire [31:0] pc4_imm;
    wire insmemrw;
    wire [31:0] idataout;
    wire [31:0] jump;
    wire [1:0] pcsrc;
    wire zero;
    wire sign;
    wire extsel, dbdatasrc, wr, rd, alusrca, alusrcb, regwre, regdst;
    wire [2:0] aluop;
    wire [4:0] writereg;
    wire [31:0] writedata, readdata1, readdata2;
    wire [31:0] alua;
    wire [31:0] alub;
    wire [31:0] result;
    wire [31:0] dataout;
    //assign curPC_low = pcout[7:0];
    //assign nextPC_low = nextPC[7:0];
    //assign ALUresult = result[7:0];
    //assign dbdata = writedata[7:0];
    //assign RSaddr = {{3'b000}, idataout[25:21]};
    //assign RSdata = readdata1[7:0];
    //assign RTaddr = {{3'b000}, idataout[20:16]};
    //assign RTdata = readdata2[7:0];
    PC curPC(
        .CLK(CLK),
        .Reset(PCreset),
        .PCin(nextPC),
        .PCWre(pcwre),
        .PCout(pcout)
    );
    PC_add_4 pc_add_4(
        .PCin(pcout),
        .PCout(pc4)
    );
    PC4_add_imm pc4_add_imm(
        .PC4(pc4),
        .imm(imm),
        .PC4_imm(pc4_imm)
    );
    Ins_Mem ins_mem(
        .addr(pcout),
        .RW(insmemrw),
        .dataOut(idataout)
    );
    Jump_Address jump_address(
       .in(idataout[25:0]),
       .PC4(pc4[31:28]),
       .out(jump)
    );
    MUX4to1_PCSrc mux4to1_pcsrc(
        .PC4(pc4),
        .PC4_imm(pc4_imm),
        .jump(jump),
        .PCSrc(pcsrc),
        .PCout(nextPC)
    );
    Control_Unit control_unit(
        .in(idataout[31:26]),
        .zero(zero),
        .sign(sign),
        .InsMemRW(insmemrw),
        .PCWre(pcwre),
        .ExtSel(extsel),
        .DBDataSrc(dbdatasrc),
        .WR(wr),
        .RD(rd),
        .ALUSrcA(alusrca),
        .ALUSrcB(alusrcb),
        .RegWre(regwre),
        .RegDst(regdst),
        .PCSrc(pcsrc),
        .ALUOp(aluop)
    );
    MUX5_RegDst mux5_regdst(
        .rt(idataout[20:16]),
        .rd(idataout[15:11]),
        .RegDst(regdst),
        .Write_Reg(writereg)
    );
    RegFile regfile(
        .CLK(CLK),
        .RST(RST),
        .RegWre(regwre),
        .ReadReg1(idataout[25:21]),
        .ReadReg2(idataout[20:16]),
        .WriteReg(writereg),
        .WriteData(writedata),
        .ReadData1(readdata1),
        .ReadData2(readdata2)
    );
    sign_zero_extend signzeroextend(
        .in(idataout[15:0]),
        .ExtSel(extsel),
        .out(imm)
    );
    MUX32_ALUSrcA mux32_alusrca(
        .Read_Data1(readdata1),
        .sa(idataout[10:6]),
        .ALUSrcA(alusrca),
        .ALUA(alua)
    );
    MUX32_ALUSrcB mux32_alusrcb(
        .Read_Data2(readdata2),
        .Extend_out(imm),
        .ALUSrcB(alusrcb),
        .ALUB(alub)
    );
    ALU32 alu32(
        .ALUopcode(aluop),
        .rega(alua),
        .regb(alub),
        .result(result),
        .zero(zero),
        .sign(sign)
    );
    Data_Mem data_mem(
        .CLK(CLK),
        .nRD(rd),
        .nWR(wr),
        .address(result),
        .writeData(readdata2),
        .Dataout(dataout)
    );
    MUX32_DBDataSrc mux32_dbdatasrc(
        .ALUresult(result),
        .DataOut(dataout),
        .DBDataSrc(dbdatasrc),
        .DB(writedata)
    );
endmodule
