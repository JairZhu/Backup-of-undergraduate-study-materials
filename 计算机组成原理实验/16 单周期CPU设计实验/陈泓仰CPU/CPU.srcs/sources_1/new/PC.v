`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 16:29:20
// Design Name: 
// Module Name: PC
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


 module PC(
    input CLK,
    input Reset,
    output [31:0] Outputpc,
    input [31:0] Inputpc
    );
    reg [31:0] Outputpc;
     always @(posedge CLK or negedge Reset)  
            begin  
                 if (Reset == 0) begin  
                         Outputpc <= 0;
                      end  
                 else begin
                      Outputpc = Inputpc; 
                end 
               end 
endmodule
