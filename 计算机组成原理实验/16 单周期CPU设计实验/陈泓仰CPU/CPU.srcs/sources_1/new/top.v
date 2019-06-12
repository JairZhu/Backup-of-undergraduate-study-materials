`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/16 19:07:17
// Design Name: 
// Module Name: top
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


module top(
    input CLK,
    input Switch,
    input [1:0] control,
    input clr,
    input Reset,
    input rst2,
    input rst,
    output [6:0] a_to_g,
    output [3:0] pos   
    );
    design_1 desgin_1(.CLK(CLK),.Switch(Switch),.control(control),.clr(clr),.Reset(Reset),.a_to_g(a_to_g),.pos(pos),.rst(rst));
endmodule
