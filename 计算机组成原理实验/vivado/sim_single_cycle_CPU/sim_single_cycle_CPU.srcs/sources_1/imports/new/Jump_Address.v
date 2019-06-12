`timescale 1ns / 1ps

module Jump_Address(
    input [25:0] in,
    input [3:0] PC4,
    output reg [31:0] out
    );
    always @(in or PC4) begin
        out = {PC4, (in << 2)};
    end
endmodule
