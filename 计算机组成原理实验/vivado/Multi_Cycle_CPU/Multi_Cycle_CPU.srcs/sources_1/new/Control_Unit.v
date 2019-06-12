`timescale 1ns / 1ps

module Control_Unit(
    input CLK, RST, zero, sign,
    input [5:0] ins,
    output reg PCWre, ExtSel, InsMemRW, IRWre, WrRegDSrc, nRD, nWR, DBDataSrc, ALUSrcB, ALUSrcA, RegWre, 
    output reg [1:0] RegDst, PCSrc,
    output reg [2:0] ALUOp
    );
    reg [2:0] curstate;
    always @(posedge CLK or negedge RST) begin
        if (RST == 0) curstate <= 0;
        else if (curstate == 0) curstate <= 1;
        else if (curstate == 1) begin
            if (ins == 6'b111000 || ins == 6'b111010 || ins == 6'b111001 || ins == 6'b111111) curstate <= 0;
            else curstate <= 2;
        end
        else if (curstate == 2) begin
            if (ins == 6'b110100 || ins == 6'b110101 || ins == 6'b110110) curstate <= 0;
            else if (ins == 6'b110000 || ins == 6'b110001) curstate <= 4;
            else curstate <= 3;
        end
        else if (curstate == 4) begin
            if (ins == 6'b110000) curstate <= 0;
            else curstate <= 3;
        end
        else if (curstate == 3) curstate <= 0;
    end
    always @(curstate or ins or zero) begin
        PCWre = (curstate == 0 && ins != 6'b111111) ? 1 : 0;
        InsMemRW = curstate == 0 ? 1 : 1;
        IRWre = curstate == 0 ? 1 : 0;
        nRD = (curstate == 4 && ins == 6'b110000) ? 1 : 0;
        nWR = (curstate == 4 && ins == 6'b110000) ? 0 : 1;
        RegWre = (curstate == 1 && ins == 6'b111010 || curstate == 3) ? 1 : 0;
        ALUSrcA = (curstate == 2 && ins == 6'b011000) ? 1 : 0;
        ALUSrcB = (curstate == 2 && (ins == 6'b000010 || ins == 6'b010010 || ins == 6'b110000 || ins == 6'b110001 || ins == 6'b100111)) ? 1 : 0;
        DBDataSrc = (curstate == 4 && ins == 6'b110001) ? 1 : 0;
        WrRegDSrc = curstate == 3 ? 1 : 0;
        ExtSel = (ins == 6'b010010 && curstate == 2) ? 0 : 1;
        if ((curstate == 0 || curstate == 1) && (ins == 6'b111000 || ins == 6'b111010)) PCSrc = 3;
        else if ((curstate == 0 || curstate == 1) && ins == 6'b111001) PCSrc = 2;
        else if ((curstate == 0 || curstate == 2) && (ins == 6'b110100 && zero == 1) || (ins == 6'b110101 && zero == 0) || (ins == 6'b110110 && zero == 0 && sign == 0)) PCSrc = 1;
        else if ((curstate == 0 || curstate == 2) && (ins == 6'b110100 && zero == 0) || (ins == 6'b110101 && zero == 1) || (ins == 6'b110110 && (zero == 1 || sign == 1))) PCSrc = 0;
        else if (curstate == 4 && ins == 6'b110000) PCSrc = 0;
        else if (curstate == 3) PCSrc = 0;
        if (curstate == 1 && ins == 6'b111010) RegDst = 0;
        else if (curstate == 3 && (ins == 6'b000010 || ins == 6'b010010 || ins == 6'b110001 || ins == 6'b100111)) RegDst = 1;
        else if (curstate == 3) RegDst = 2;
        if (curstate == 2) begin
            if (ins == 6'b000000 || ins == 6'b000010 || ins == 6'b110000 || ins == 6'b110001) ALUOp = 3'b000;
            else if (ins == 6'b000001 || ins == 6'b110100 || ins == 6'b110101 || ins == 6'b110110) ALUOp = 3'b001;
            else if (ins == 6'b010000 || ins == 6'b010010) ALUOp = 3'b101;
            else if (ins == 6'b010001) ALUOp = 3'b110;
            else if (ins == 6'b100110 || ins == 6'b100111) ALUOp = 3'b011;
            else if (ins == 6'b011000) ALUOp = 3'b100;
        end
        else if (curstate == 0 && (ins == 6'b110100 || ins == 6'b110101 || ins == 6'b110110)) ALUOp = 3'b001;
    end
endmodule
