`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 22:42:25
// Design Name: 
// Module Name: MuxForReadData1
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


module MuxForReadData1(
    input AluSrcA,
    input [31:0] Data,
    input [4:0] Sa,
    output [31:0] Result
    );
    assign Result = (AluSrcA)?Sa:Data;
endmodule
