`timescale 1ns / 1ps

module sim(
    );
    reg CLK, RST;
    initial begin
        CLK = 0;
        RST = 0;
        #1 RST = 1;
    end
    Multi_Cycle_CPU multicycleCPU(
        .CLK(CLK),
        .RST(RST)
    );
    always #5 CLK = ~CLK;
endmodule
