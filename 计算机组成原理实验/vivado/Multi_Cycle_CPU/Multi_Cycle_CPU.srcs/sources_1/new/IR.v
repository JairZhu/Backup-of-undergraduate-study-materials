`timescale 1ns / 1ps

module IR(
    input [31:0] InsOut,
    input IRWre,
    input CLK,
    output reg [5:0] op,
    output reg [4:0] rs, rt, rd, sa, 
    output reg [15:0] immediate,
    output reg [25:0] addressJmp
    );
    always @(posedge CLK) begin 
        if (IRWre == 1) begin
            op[5:0] <= InsOut[31:26]; 
            rs[4:0] <= InsOut[25:21]; 
            rt[4:0] <= InsOut[20:16]; 
            rd[4:0] <= InsOut[15:11]; 
            sa[4:0] <= InsOut[10:6]; 
            immediate[15:0] <= InsOut[15:0]; 
            addressJmp[25:0] <= InsOut[25:0];
        end 
    end
endmodule
