`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/17 23:37:45
// Design Name: 
// Module Name: choose
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


module choose(
    input PCWre,
    input [31:0] Inputpc,
    input [1:0] PCSrc,
    input [25:0] AJshift,
    input [31:0] Immediate,
    output [31:0] Outputpc
    );
    reg [31:0] Outputpc;
     always @(*)  
               begin  
                    if(PCWre == 0) begin Outputpc <= Inputpc; end
                         if (PCWre) begin  // PCWre为1时PC更改，PCWre为0时PC不更改
                             if (PCSrc == 2'b00) Outputpc <= Inputpc + 4;  // 跳转到下一指令指令
                             else if(PCSrc == 2'b01) 
                                   Outputpc <= Inputpc + 4 + Immediate * 4;  // 分支指令
                             else if(PCSrc == 2'b10) begin
                                  // Outputpc <=  8'h00000038;
                                  Outputpc <= {4'b0000,AJshift,2'b00};
                             end  
                   end 
                  end 
endmodule
