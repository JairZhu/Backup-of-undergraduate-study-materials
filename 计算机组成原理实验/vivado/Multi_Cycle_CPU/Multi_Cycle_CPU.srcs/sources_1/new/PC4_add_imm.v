`timescale 1ns / 1ps

module PC4_add_imm(
    input [31:0] PC4, imm,
    output reg [31:0] PC4_imm
    );
    always @(PC4 or imm) begin
        PC4_imm = PC4 + (imm << 2);
    end
endmodule
