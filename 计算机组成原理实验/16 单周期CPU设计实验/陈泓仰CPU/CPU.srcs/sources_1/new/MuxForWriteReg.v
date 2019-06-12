`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/11 00:26:14
// Design Name: 
// Module Name: MuxForWriteReg
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


module MuxForWriteReg(
    input RegDst,
    input [4:0] rt,
    input [4:0] rd,
    output [4:0] Result
    );
    assign Result = (RegDst == 1)?rd : rt;
endmodule
