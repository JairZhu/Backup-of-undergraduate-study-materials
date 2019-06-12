`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/12 12:43:09
// Design Name: 
// Module Name: simulation
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


module simulation;
    reg CLK;
    reg Switch;
    reg Reset;
    reg rst;
    reg clr;
    reg [1:0] control;
    wire [6:0] a_to_g;
    wire [3:0] pos;
    initial begin
        CLK = 0;
        Reset = 0;
        rst = 0;
        Switch = 0;
        clr = 1;
        control = 2'b10;
        #20 rst = 1;
        #40 Reset = 1;
        #20 clr = 0;
        #800 $stop;
    end
    always #10 CLK <= ~CLK;
    always #10 Switch <= ~Switch;
    design_1 desgin_1(.CLK(CLK),.Switch(Switch),.control(control),.clr(clr),.Reset(Reset),.a_to_g(a_to_g),.pos(pos),.rst(rst));
endmodule
