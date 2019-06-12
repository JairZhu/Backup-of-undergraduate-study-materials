`timescale 1ns / 1ps

module select(
	input wire clk,
	input wire change,
	input wire [3:0] hour_high,
							input wire [3:0] hour_low,
							input wire [3:0] min_high,
							input wire [3:0] min_low,
							input wire [3:0] sec_high,
							input wire [3:0] sec_low,
							output reg [3:0] digit3,
							output reg [3:0] digit2,
							output reg [3:0] digit1,
							output reg [3:0] digit0
	);
					always@(posedge clk)
					begin
						if(change==1)
						begin
							digit3<=hour_high;
    						digit2<=hour_low;
    						digit1<=min_high;
    						digit0<=min_low;
						end
						else if(change==0)
							begin
								digit3<=min_high;
    							digit2<=min_low;
    							digit1<=sec_high;
    							digit0<=sec_low;
							end
	end
endmodule

