`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 20:56:14
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input CLK,
    input Reset,
    input RegWre,
    input [4:0] ReadReg1,
    input [4:0] ReadReg2,
    input [4:0] WriteReg,
    input [31:0] WriteData,
    output [31:0] ReadData1,
    output [31:0] ReadData2
    );
    reg [31:0] regFile[0:31];
    integer i;
    assign ReadData1 = regFile[ReadReg1];
    assign ReadData2 = regFile[ReadReg2];
    always@(negedge CLK or negedge Reset) begin
        if(Reset == 0) begin
            for(i = 0;i < 32;i = i + 1)
                regFile[i] <= 0;
        end
        else begin
            if(RegWre == 1) begin
                  regFile[WriteReg] <= WriteData;
            end
        end
     end
endmodule
