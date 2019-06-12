`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/15 21:29:21
// Design Name: 
// Module Name: clk_40hz
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


module clk_40hz(
    input wire CLK,
    input wire clr,
    output clk_40hz
    );
    reg [40:0] q;
    reg clk_40hz1;
    always@(posedge CLK or negedge clr) begin
        if(clr == 1)begin
            q <= 0;
         end
         else if(q >= 624999) begin
            q <= 0;
            clk_40hz1 = ~clk_40hz1;
          end
          else 
            q = q+ 1;
     end
   assign clk_40hz =  clk_40hz1;
endmodule
