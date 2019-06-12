`timescale 1ns / 1ps

module Control_Unit(
    input [5:0] in,
    input zero,
    input sign,
    output reg InsMemRW, PCWre, ExtSel, DBDataSrc, WR, RD, ALUSrcA, ALUSrcB, RegWre, RegDst,
    output reg [1:0] PCSrc,
    output reg [2:0] ALUOp
    );
    always @(in or zero or sign)begin
        InsMemRW = 0;
        PCWre = (in == 6'b111111) ? 0 : 1;
        ExtSel = (in == 6'b010000) ? 0 : 1;
        DBDataSrc = (in == 6'b100111) ? 1 : 0;
        WR = (in == 6'b100110) ? 0 : 1;
        RD = (in == 6'b100111) ? 0 : 1;
        ALUSrcA = (in == 6'b011000) ? 1 : 0;
        ALUSrcB = (in == 6'b000001 || in == 6'b010000 || in == 6'b100110 || in == 6'b100111) ? 1 : 0;
        RegWre = (in == 6'b110000 || in == 6'b110001 || in == 6'b110010 || in == 6'b100110 || in == 6'b111111 || in == 6'b111000) ? 0 : 1;
        RegDst = (in == 6'b000001 || in == 6'b010000 || in == 6'b100111) ? 0 : 1;
        
        if (in == 6'b111000) PCSrc = 2'b10;
        else if (in == 6'b110000 && zero == 1 || in == 6'b110001 && zero == 0 || in == 6'b110010 && sign == 0 && zero == 0) PCSrc = 2'b01;
        else PCSrc = 2'b00;
        
        if (in == 6'b000000 || in == 6'b000001 || in == 6'b100110 || in == 6'b100111) ALUOp = 3'b000;
        else if (in == 6'b000010 || in == 6'b110000 || in == 6'b110001 || in == 6'b110010) ALUOp = 3'b001;
        else if (in == 6'b011000) ALUOp = 3'b010;
        else if (in == 6'b010000 || in == 6'b010010) ALUOp = 3'b011;
        else if (in == 6'b010001) ALUOp = 3'b100;
        else if (in == 6'b011100) ALUOp = 3'b110;
        else ALUOp = 3'b111;
     end
endmodule
