`timescale 1ns / 1ps

module Sign_Zero_Extend(
    input [15:0] in,
    input ExtSel,
    output reg [31:0] out
    );
    always @(in or ExtSel) begin
        if (ExtSel == 0) out =  {{16{1'b0}}, in};
        else if (in[15] == 0) out = {{16{1'b0}}, in};
        else out = {{16{1'b1}}, in};
    end
endmodule
