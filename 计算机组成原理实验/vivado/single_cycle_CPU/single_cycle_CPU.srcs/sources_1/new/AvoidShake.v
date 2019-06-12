`timescale 1ns / 1ps

module AvoidShake(
    input CLK_40,
    input in,
    output out
    );
    reg tmp_in[2:0];
    always @(posedge CLK_40) begin
        tmp_in[0] <= in;
        tmp_in[1] <= tmp_in[0];
        tmp_in[2] <= tmp_in[1];
    end
    assign out = tmp_in[1] | tmp_in[2];
endmodule
