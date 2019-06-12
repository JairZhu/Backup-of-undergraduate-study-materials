`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 22:14:56
// Design Name: 
// Module Name: SignZeroExtend
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


module SignZeroExtend(
    input [15:0] InData,
    input ExtSel,
    output [31:0] OutData
    );
    assign OutData[15:0] = InData;
    assign OutData[31:16] = (ExtSel == 1)?(InData[15]? 16'hffff : 16'h0000) : 16'h0000;
endmodule
