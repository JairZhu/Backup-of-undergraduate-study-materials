`timescale 1ns / 1ps

module MUX32_DBDataSrc(
    input [31:0] ALUresult, DataOut,
    input DBDataSrc,
    output reg [31:0] DB
    );
    always @(ALUresult or DataOut or DBDataSrc) begin
            if (DBDataSrc == 1) DB = DataOut;
            else DB = ALUresult;
        end
endmodule
