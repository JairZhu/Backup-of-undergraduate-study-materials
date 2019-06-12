`timescale 1ns / 1ps

module x7seg_msg(
    input CLK_div,
    input clr,
    input [15:0] res,
    output [6:0] a_to_g,
    output [3:0] pos
    );
    reg [1:0] s;
    reg [3:0] pos;
    reg [6:0] a_to_g;
    reg [3:0] digit;
    wire [3:0] aen;
    assign aen = 4'b1111;
    always@(*)begin
        case(s)
        0:begin digit <= res[3:0];end
        1:begin digit <= res[7:4];end
        2:digit <= res[11:8];
        3:digit <= res[15:12];
        endcase
      end
      always@(*)begin
        case(digit)
            4'b0000:a_to_g <= 7'b0000001;
            4'b0001:a_to_g <= 7'b1001111;
            4'b0010:a_to_g <= 7'b0010010;
            4'b0011:a_to_g <= 7'b0000110;
            4'b0100:a_to_g <= 7'b1001100;
            4'b0101:a_to_g <= 7'b0100100;
            4'b0110:a_to_g <= 7'b0100000;
            4'b0111:a_to_g <= 7'b0001111;
            4'b1000:a_to_g <= 7'b0000000;
            4'b1001:a_to_g <= 7'b0000100;
            4'b1010:a_to_g <= 7'b0001000;
            4'b1011:a_to_g <= 7'b1100000;
            4'b1100:a_to_g <= 7'b0110001;
            4'b1101:a_to_g <= 7'b1000010;
            4'b1110:a_to_g <= 7'b0110000;
            4'b1111:a_to_g <= 7'b0111000;
        endcase
      end
      always@(posedge CLK_div or negedge clr)begin
        if(clr == 1) begin
            s <= 0;
        end
        else begin
             if(s == 2'b11) begin
                  s <= 0;
            end
            else
                  s <= s + 1;
        end
      end
        always@(*) begin
            pos <= 4'b1111;
            if(aen[s] == 1)
                pos[s] <= 0;
            if(clr == 1)
                pos <= 4'b1111;
       end
endmodule
