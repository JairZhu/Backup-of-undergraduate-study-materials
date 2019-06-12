`timescale 1ns / 1ps

module count_60(
    input clk,
    output out
);
    wire [5:0] tmp;
    always@(posedge clk) 
        if (tmp == 59) tmp = 0;
        else tmp <= tmp + 1; 
    if (tmp == 59) out = 1;
    else out = 0;
endmodule

module count_10(
    input clk,
    input en,
    input clr,
    input load,
    input [3:0] in,
    output reg [3:0] out,
    output rcout
);
    always@(posedge clk or posedge clr)
        begin
        if (clr) out = 0;
        else if (en) 
        else if (load) out = in;
            begin
            if (out == 9) out = 0;
            else out <= out + 1;
            end
        end
    assign rcout = ((out == 9) & en) ? 1 : 0;
endmodule

module selector_6(
    input x0, x1, x2, x3, x4, x5,
    input [2:0] in,
    output reg y
);
    always@(*)
        case(in)
        0: y = x0;
        1: y = x1;
        2: y = x2;
        3: y = x3;
        4: y = x4;
        5: y = x5;
        default: y = 0;
        endcase
endmodule

module count_6(
    input clk,
    output reg [2:0] out
);
    always@(posedge clk) 
        begin 
        if (out == 5) out = 0;
        else out <= out + 1;
        end
endmodule

module decoder(
    input [1:0] in,
    output reg [3:0] out
);
    integer i;
    always@(*)
        for (i = 0; i < 4; i =+ 1)
        if (in == i) out[i] = 0;
        else out[i] = 1;
endmodule

module hex7seg(
    input [3:0] x,
    output reg [6:0] y
);
always@(*)
    case(x)
    0: y = 7'b0000001;
    1: y = 7'b1001111;
    2: y = 7'b0010010;
    3: y = 7'b0000110;
    4: y = 7'b1001100;
    5: y = 7'b0100100;
    6: y = 7'b0100000;
    7: y = 7'b0001111;
    8: y = 7'b0000000;
    9: y = 7'b0000100;
    'hA: y = 7'b0001000;
    'hB: y = 7'b1100000;
    'hC: y = 7'b0110001;
    'hD: y = 7'b1000010;
    'hE: y = 7'b0110000;
    'hF: y = 7'b0111000;
    default: y = 7'b0000001;
    endcase
endmodule

module clock(
    output [6:0] seg,
    output [3:0] en,
    output second
);
    reg clk = 0;  
    always#1000000000 clk <= ~clk;
    assign second = clk;
    wire high = 1;
    wire low = 0;
    wire stage1 = 4'b0000;
    wire [3:0] secondout1;
    wire secondcout1;
    wire [3:0] secondout2;
    wire secondcout2;
    count_10 secondcount1(clk, high, low, stage1, secondout1, secondcout1);
    wire secondw1;
    assign secondw1 = secondout1[0] & secondout1[3] & secondout2[0] & secondout2[2];
    count_10 secondcount2(clk, cout1, secondw1, stage1, secondcount2, secondcout2);

endmodule
