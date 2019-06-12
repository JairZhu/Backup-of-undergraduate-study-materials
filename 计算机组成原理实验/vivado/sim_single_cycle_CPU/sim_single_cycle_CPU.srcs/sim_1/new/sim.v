`timescale 1ns / 1ps

module sim(
    );
    reg RST;
    reg CLK;
    reg reset;
    initial begin
        reset = 0;
        CLK = 0;
        RST = 0;
        #10 RST = 1;
        #10 reset = 1;
    end
    single_cycle_CPU singlecyclecpu(
        .CLK(CLK),
        .PCreset(reset),
        .RST(RST)
    );
    always #5 CLK = ~CLK;
endmodule
