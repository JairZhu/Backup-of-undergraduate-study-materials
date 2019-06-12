`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/15 21:15:30
// Design Name: 
// Module Name: CLK_div1
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


module CLK_div1(
    input CLK,
    input clr,
    output CLK_div
    );
   reg CLK_div1;
    reg [40:0] q;
   always@(posedge CLK or negedge clr) begin
        if(clr == 1) begin
            q <= 0;
        end
        else if( q >= 249999) begin
            q<= 0;
            CLK_div1 = ~CLK_div1;
        end
        else
            q = q + 1;
    end
    assign CLK_div = CLK_div1;
endmodule
