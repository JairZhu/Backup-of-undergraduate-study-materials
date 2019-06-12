`timescale 1ns / 1ps

module CLKDIV_40(
    input clk_sys,
    output clk_40
    );
    reg [40:0] tmp;
    reg tmp_clk = 0;
    always @(posedge clk_sys) begin
        if (tmp >= 624999) begin
            tmp <= 0;
            tmp_clk = ~tmp_clk;
        end
        else tmp <= tmp + 1;
    end
    assign clk_40 = tmp_clk;
endmodule
