`timescale 1ns / 1ps

module state_machine(
input clk,
input clr,
input pre,
input [2:0] prefore,
output reg [2:0] later
);
always @ (posedge clk or negedge clr or posedge pre)
    begin
    if (clr == 0) later = 3'b000;   
    else if (pre == 1) later = 3'b111;
    else 
        case(prefore)
        3'b000 : later = 3'b100;
        3'b100 : later = 3'b010;
        3'b010 : later = 3'b001;
        3'b001 : later = 3'b000;
        default : later = 3'b000;
        endcase
    end
endmodule

module project(
input clk,
input left,
input right,
input brake,
input clr,
input [5:0] in,
output [5:0] light 
);
wire lc;
assign lc = (left | right | brake) & (left | ~right | brake) & clr;
wire rc;
assign rc = (left | right | brake) & (~left | right | brake) & clr;
wire lp;
assign lp = ~left & ~right & brake | ~left & right & brake;
wire rp;
assign rp = ~left & ~right & brake | left & ~right & brake;
state_machine mysm1(clk, lc, lp, in[2:0], light[2:0]);
state_machine mysm2(clk, rc, rp, in[5:3], light[5:3]);
endmodule

module simu();
reg clk = 0;
always #1 clk = ~clk;
reg left = 0;
reg right = 1;
always #14 left = ~left;
always #28 right = ~right;
reg brake = 0;
always #98 brake = ~brake;
reg clr = 0;
always #196 clr = ~clr;
wire [5:0] out;
project myp(clk, left, right, brake, clr, out[5:0], out[5:0]);
endmodule