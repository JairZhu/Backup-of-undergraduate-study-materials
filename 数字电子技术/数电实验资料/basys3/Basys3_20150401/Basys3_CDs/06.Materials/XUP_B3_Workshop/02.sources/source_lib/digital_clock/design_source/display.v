`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: display

//////////////////////////////////////////////////////////////////////////////////

module display(
    input wire clk,reset,
    input wire [7:0]bcd_s,bcd_m,bcd_h,
    output wire [6:0]seg,
    output reg [7:0]ans
    );
    reg [20:0]count;
    reg [3:0]digit; 
    always@(posedge clk,posedge reset)
    if(reset)  
        count = 0;
    else 
        count = count + 1;
       
    always @(posedge clk)
    case(count[20:18])
        1:begin
            ans = 8'b1101_1111;
            digit = bcd_h[7:4];
        end
        
        2:begin
            ans = 8'b1110_1111;
            digit = bcd_h[3:0];
        end

        3:begin
            ans = 8'b1111_0111;
            digit = bcd_m[7:4];
        end
        
        4:begin
            ans = 8'b1111_1011;
            digit = bcd_m[3:0];
        end
             
        5:begin
            ans = 8'b1111_1101;
            digit = bcd_s[7:4];
        end
        
        6:begin
            ans = 8'b1111_1110;
            digit = bcd_s[3:0];
        end 
    endcase
    
    seg7 U4(.din(digit),.dout(seg));
endmodule
