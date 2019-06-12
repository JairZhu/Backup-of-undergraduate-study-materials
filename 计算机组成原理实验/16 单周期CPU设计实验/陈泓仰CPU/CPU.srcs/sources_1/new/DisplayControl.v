`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/15 20:24:36
// Design Name: 
// Module Name: DisplayControl
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


module DisplayControl(
    input [31:0] NowPC,
    input [31:0] NextPC,
    input [4:0] RsAddr,
    input [31:0] RsData,
    input [4:0] RtAddr,
    input [31:0] RtData,
    input [31:0] AluResult,
    input [31:0] DbResult,
    input [1:0] control,
    output reg [15:0] res
    );
    always@(*) begin
        if(control == 2'b00) begin
            res = {NowPC[7:0] , NextPC[7:0]};
        end
        else if(control == 2'b01) begin
            res[15:13] = 3'b000;
            res[13:8] = RsAddr;
            res[7:0] = RsData[7:0];
         end
         else if(control == 2'b10) begin
            res[15:13] = 3'b000;
            res[13:8] = RtAddr;
            res[7:0] = RtData[7:0];
         end
         else if(control == 2'b11)begin
            res[15:8] = AluResult[7:0];
            res[7:0] = DbResult[7:0];
         end
     end
endmodule
