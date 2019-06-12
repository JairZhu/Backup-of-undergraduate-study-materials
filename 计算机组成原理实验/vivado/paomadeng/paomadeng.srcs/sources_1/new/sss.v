`timescale 1ns / 1ps

module paomadeng( 
	input re, 
	input clk,
	input [2:0] sel, output reg [15:0] led 
	);
	reg[15:0] led_r,led_r1; 
	reg con0,con1,dir; 
	reg[3:0] con2; 
	reg[2:0] con3;
	reg[25:0] divclk_cnt; 
	reg divclk;

	always@(posedge clk) 
	begin
		if(divclk_cnt==26'd20000000) 
		begin
			divclk =~ divclk; 
			divclk_cnt = 0;
		end 
		else 
		begin
			divclk_cnt = divclk_cnt+1'b1; 
		end
	end
	
always@(posedge divclk) 
begin
		if(re) begin con0<=0;con1<=0;con2<=0;dir<=0;end 
		else
		case(sel) 
		3'b000://全部亮全部灭交替显示
		   begin
             led_r=16'b0000000000000000; 
             if(con0==0)led<=~led_r; 
             else led<=led_r;
             con0=con0+1; 
           end            
		3'b001: //交替亮
			begin
			led_r=16'b0101010101010101; 
			if(con1==0)led<=led_r; 
			else led<=led_r<<1; 
			con1<=con1+1; 
			end
			
		3'b010://从左到右逐个亮
		   begin
           led_r=16'b1000000000000000;
           if (led==16'b0000000000000001 || led==16'b0000000000000000)
               led=led_r;
           else
               led=led >> 1;
        end
        
        3'b011://从右到左逐个亮
              begin
                 led_r=16'b0000000000000001;
                 if (led==16'b1000000000000000 || led==16'b0000000000000000)
                     led=led_r;
                 else
                     led=led << 1;
              end
				 	
		3'b100: // LED从右到左依次点亮，全部点亮后依次熄灭
		begin
		if(!dir) 
			begin
			if(con2==0) begin led_r=16'b0000000000000001;led<=led_r;end 
			else begin led<=(led<<1)+led_r;end 
			if(con2==15) begin dir<=~dir;end 
			con2<=con2+1; 
			end
		else 
			begin
			if(con2==0) 
				begin 	
				led_r=16'b1111111111111110;led<=led_r;end 
			else begin led<=led<<1; end 
			if(con2==15) begin dir<=~dir;end
			con2<=con2+1; 
			end
		end 
		3'b101: begin
			if(!dir) 
			begin
				if(con2==0) begin led_r=16'b1000000000000000;led<=led_r;
			end 
			else begin led<=(led>>1)+led_r;end 
			if(con2==15) begin dir<=~dir;end 
			con2<=con2+1; 
			end
			else 
			begin
				if(con2==0) begin
				led_r=16'b0111111111111111;led<=led_r;end 
				else begin led<=led>>1; end 
				if(con2==15) begin dir<=~dir;end 
				con2<=con2+1; 
				end
			end

		3'b110: // LED由两侧向中间依次显示，再全灭
		    begin 
                  if(led!=16'b1111111111111111)      
                   begin   
                          led<=led_r|led_r1;
                         led_r=(led_r<<1)|led_r; 
                         led_r1=(led_r1>>1)|led_r1;
      
                       
                    end 
                 else
                 begin
                      led=16'b0000000000000000;
                      led_r=16'b0000000000000001;                                        
                      led_r1=16'b1000000000000000;
                 end
       end
       
       3'b111:// LED由中间向两侧依次显示，再全灭
        begin 
                   if(led!=16'b1111111111111111)      
                    begin   
                           led<=led_r|led_r1;
                          led_r=(led_r<<1)|led_r; 
                          led_r1=(led_r1>>1)|led_r1;
       
                        
                     end 
                  else
                  begin
                       led=16'b0000000000000000;
                       led_r=16'b0000000110000000;                                        
                       led_r1=16'b0000000110000000;
                  end
        end
        endcase

end
endmodule

module simu();
    reg clk = 0;
    always #1 clk = ~clk;
    reg [2:0] sel;
    always #100 
        begin
        if (sel == 7) sel = 0;
        else sel <= sel + 1;
        end
    wire re;
    assign re = 0;
    wire [15:0] out;
    paomadeng my(re, clk, sel, out);
endmodule