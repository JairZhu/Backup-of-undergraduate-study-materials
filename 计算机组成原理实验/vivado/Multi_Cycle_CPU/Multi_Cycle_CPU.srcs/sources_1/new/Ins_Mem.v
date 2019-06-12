`timescale 1ns / 1ps

module Ins_Mem(
    input [31:0] addr,
    input RW,
    output reg [31:0] dataOut
    );
    reg [7:0] rom [99:0];
    initial begin
	$readmemb ("D:/vivado/Multi_Cycle_CPU/rom.txt", rom);
    //$readmemb ("D:/vivado/single_cycle_CPU/rom_data.txt", rom);
    end
    always @(addr) begin 
        if (RW == 1) begin// 读存储器。大端数据存储模式
            dataOut[31:24] = rom[addr];
            dataOut[23:16] = rom[addr+1];
            dataOut[15:8] = rom[addr+2];
            dataOut[7:0] = rom[addr+3];
        end
    end
endmodule
