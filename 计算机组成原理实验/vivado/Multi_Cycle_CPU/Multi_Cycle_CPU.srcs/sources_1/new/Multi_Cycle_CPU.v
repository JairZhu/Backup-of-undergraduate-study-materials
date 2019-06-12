`timescale 1ns / 1ps

module Multi_Cycle_CPU(
    input CLK, RST,
    output wire [7:0] curPC_low, nextPC_low, RSaddr, RSdata, RTdata, RTaddr, ALUresult, DBdata
    );
    wire [31:0] curPC, nextPC, PC4, insdata, db, writedata, readdata1, readdata2, extendimm, jumpaddress, adr, bdr, alua, alub, result, pc4imm, aluout, dataout, dbdata;
    wire [5:0] insop;
    wire [1:0] regdst, pcsrc;
    wire [2:0] aluop;
    wire [4:0] rs, rt, rd, sa, writereg;
    wire [15:0] immediate;
    wire [25:0] addressJmp;
    wire pcwre, insmemrw, zero, sign, extsel, irwre, wrregdsrc, nrd, nwr, dbdatasrc, alusrcb, alusrca, regwre;
    assign curPC_low = curPC[7:0];
        assign nextPC_low = nextPC[7:0];
        assign ALUresult = result[7:0];
        assign DBdata = writedata[7:0];
        assign RSaddr = {{3'b000}, insdata[25:21]};
        assign RSdata = readdata1[7:0];
        assign RTaddr = {{3'b000}, insdata[20:16]};
        assign RTdata = readdata2[7:0];
	PC pc(
	   .CLK(CLK),
	   .Reset(RST),
	   .PCin(nextPC),
	   .PCWre(pcwre),
	   .PCout(curPC)
	);
	PC_add_4 pc_add_4(
	   .PCin(curPC),
	   .PCout(PC4)
	);
	Ins_Mem ins_mem(
	   .addr(curPC),
	   .RW(insmemrw),
	   .dataOut(insdata)
	);
	Control_Unit control_unit(
	   .CLK(CLK),
	   .RST(RST),
	   .zero(zero),
	   .sign(sign),
	   .ins(insop),
	   .PCWre(pcwre),
	   .ExtSel(extsel),
	   .InsMemRW(insmemrw),
	   .IRWre(irwre),
	   .WrRegDSrc(wrregdsrc),
	   .nRD(nrd),
	   .nWR(nwr),
	   .DBDataSrc(dbdatasrc),
	   .ALUSrcB(alusrcb),
	   .ALUSrcA(alusrca),
	   .RegWre(regwre),
	   .RegDst(regdst),
	   .PCSrc(pcsrc),
	   .ALUOp(aluop)
	);
	IR ir(
	   .InsOut(insdata),
	   .IRWre(irwre),
	   .CLK(CLK),
	   .op(insop),
	   .rs(rs),
	   .rt(rt),
	   .rd(rd),
	   .sa(sa),
	   .immediate(immediate),
	   .addressJmp(addressJmp)
	);
	MUX_WriteReg mux_write(
	   .rt(rt),
	   .rd(rd),
	   .RegDst(regdst),
	   .Write_Reg(writereg)
	);
	MUX_Write_Data mux_write_data(
	   .PC4(PC4),
	   .DB(db),
	   .WrRegDSrc(wrregdsrc),
	   .Write_Data(writedata)
	);
	RegFile regfile(
	   .RST(RST),
	   .CLK(CLK),
	   .RegWre(regwre),
	   .ReadReg1(rs),
	   .ReadReg2(rt),
	   .WriteReg(writereg),
	   .WriteData(writedata),
	   .ReadData1(readdata1),
	   .ReadData2(readdata2)
	);
	Sign_Zero_Extend sign_zero_extend(
	   .in(immediate),
	   .ExtSel(extsel),
	   .out(extendimm)
	);
	Jump_Address jump_address(
	   .in(addressJmp),
	   .PC4_high4(PC4[31:28]),
	   .out(jumpaddress)
	);
	ADR Adr(
	   .Read_Data1(readdata1),
	   .CLK(CLK),
	   .readdata(adr)
	);
	BDR Bdr(
	   .Read_Data2(readdata2),
	   .CLK(CLK),
	   .readdata2(bdr)
	);
	MUX32_ALUSrcA mux32_alusrca(
	   .Read_Data1(adr),
	   .sa(sa),
	   .ALUSrcA(alusrca),
	   .ALUA(alua)
	);
	MUX32_ALUSrcB mux32_alusrcb(
	   .Read_Data2(bdr),
	   .Extend_out(extendimm),
	   .ALUSrcB(alusrcb),
	   .ALUB(alub)
	);
	ALU32 alu32(
	   .ALUopcode(aluop),
	   .rega(alua),
	   .regb(alub),
	   .Result(result),
	   .zero(zero),
	   .sign(sign)
	);
	PC4_add_imm pc4_add_imm(
	   .PC4(PC4),
	   .imm(extendimm),
	   .PC4_imm(pc4imm)
	);
	MUX4to1_PCSrc mux4to1(
	   .PC4(PC4),
	   .PC4_imm(pc4imm),
	   .jump(jumpaddress),
	   .Reg_Data(readdata1),
	   .PCSrc(pcsrc),
	   .PCout(nextPC)
	);
	ALUoutDR aluoutdr(
	   .ALUresult(result),
	   .CLK(CLK),
	   .ALUout(aluout)
	);
	Data_Mem data_mem(
	   .nRD(nrd),
	   .nWR(nwr),
	   .address(aluout),
	   .writeData(bdr),
	   .Dataout(dataout)
	);
	MUX32_DBDataSrc mux32_dbdatasrc(
	   .ALUresult(result),
	   .DataOut(dataout),
	   .DBDataSrc(dbdatasrc),
	   .DB(dbdata)
	);
	DBDR dbdr(
	   .DBData(dbdata),
	   .CLK(CLK),
	   .DB(db)
	);
endmodule
