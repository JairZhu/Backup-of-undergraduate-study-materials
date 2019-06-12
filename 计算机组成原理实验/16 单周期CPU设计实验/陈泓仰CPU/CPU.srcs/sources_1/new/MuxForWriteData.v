`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 22:47:01
// Design Name: 
// Module Name: MuxForWriteData
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


module MuxForWriteData(
    input DBDataSrc,
    input [31:0] AluData,
    input [31:0] MemData,
    output [31:0] Result
    );
    assign Result = (DBDataSrc == 1)? MemData: AluData; 
endmodule
