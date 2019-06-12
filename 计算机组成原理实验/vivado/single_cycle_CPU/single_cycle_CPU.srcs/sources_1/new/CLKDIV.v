`timescale 1ns / 1ps

module CLKDIV(
    input CLK,
    output CLK190
    );
    reg [40:0] q;
    always@(posedge CLK) q <= q + 1;
    assign CLK190 = q[17]; 
endmodule
