`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 22:44:36
// Design Name: 
// Module Name: MuxForReadData2
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


module MuxForReadData2(
    input AluSrcB,
    input [31:0] Data2,
    input [31:0] ExtendResult,
    output [31:0] Result
    );
    assign Result = (AluSrcB)?ExtendResult : Data2;
endmodule
