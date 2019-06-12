`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/15 21:17:29
// Design Name: 
// Module Name: avoidshake
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


module avoidshake(
    input BJ_CLK, //采集时钟，40Hz
    input BUTTON_IN, //按键输入信号
    output BUTTON_OUT //消抖后的输出信号
    );
   reg BUTTON_IN_Q, BUTTON_IN_2Q, BUTTON_IN_3Q;
    always @(posedge BJ_CLK)begin
         begin
            BUTTON_IN_Q <= BUTTON_IN;
            BUTTON_IN_2Q <= BUTTON_IN_Q;
            BUTTON_IN_3Q <= BUTTON_IN_2Q;
         end
    end
    assign BUTTON_OUT = BUTTON_IN_2Q | BUTTON_IN_3Q;
endmodule
