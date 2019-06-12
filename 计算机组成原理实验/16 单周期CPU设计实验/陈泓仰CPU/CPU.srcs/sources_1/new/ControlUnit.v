`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 20:26:46
// Design Name: 
// Module Name: ControlUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ControlUnit(
    input [5:0] op,
    input Zero,
    input Sign,
    output ExtSel,
    output PCWre,
    output InsMemRW,
    output RegDst,
    output RegWre,
    output [2:0] AluOp,
    output AluSrcA,
    output AluSrcB,
    output RD,
    output WR,
    output DBDataSrc,
    output [1:0] PCSrc
    );
    assign InsMemRW = 1;
    assign PCWre = (op == 6'b111111)? 0 : 1;//halt
    assign RegDst = (op == 6'b101000 || op == 6'b100111 || op == 6'b100011 |op ==6'b000111 )? 0:1;
    assign RegWre = (op == 6'b101100 || op == 6'b000100 || op == 6'b000101 || op == 6'b000111 || op == 6'b000010 || op == 6'b111111)?0:1;
    assign AluSrcA = (op == 6'b101101)?1:0;
    assign AluSrcB = (op == 6'b101000 || op == 6'b100111 || op == 6'b100011 || op == 6'b101100)? 1 : 0;
    assign RD = (op == 6'b100011)? 0 :1;
    assign WR = (op == 6'b101100)? 0 : 1;
    assign DBDataSrc = (op == 6'b100011 || op == 6'b101100) ? 1 : 0;
    assign ExtSel = (op == 6'b101101 || op == 6'b100111)?0:1;
    assign PCSrc[1] = (op == 6'b000010)?1:0;
    assign PCSrc[0] = (op == 6'b000100 && Zero == 1|| op == 6'b000101 && Zero == 0 || op == 6'b000111 && Zero == 1)? 1 : 0;
    assign AluOp[2] = (op == 6'b000111 || op == 6'b101010 || op == 6'b100100)?1:0;
    assign AluOp[1] = (op == 6'b100101 ||  op == 6'b100111 || op == 6'b101101 || op == 6'b000010|| op == 6'b000111)? 1:0;
    assign AluOp[0] = (op == 6'b101010 || op == 6'b100111|| op == 6'b100010 || op == 6'b100101 ||  op == 6'b000100 || op == 6'b000101)?1:0;

endmodule