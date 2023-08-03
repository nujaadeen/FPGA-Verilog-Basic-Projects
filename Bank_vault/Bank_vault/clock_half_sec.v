module clock_half_sec( // half a second clock
	input clk, // basys 3 board clock, 100 MHz
	output reg clock_half // half a second clock, 2 Hz
	);
	
	reg [28:0] count=0;
	
	always@(posedge clk)
		begin
		count<=count+1;
		
		if (count==49_999_999) //50M, 0 to 499,999,999
			begin
			count<=0;
			clock_half=~clock_half;
			end
		end
endmodule
