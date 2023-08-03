module Bank_Vault_Lock_Controller(
	input clk, // system clock
	input P, // President  //sw1
	input [1:0] VP, // VicePresidents  //sw2 &  sw3
	input Open, // Bank Open(1) or closed(0)   //sw4
	output reg [7:1] LED, // LED blinking when unlock // 7 led
	output Unlock // when unlock right most LED stay solid // 1 led
		);
		
		
		// from logic table
		assign Unlock = (P&VP[1]) | (P&VP[0]) | (Open&P) | (Open&VP[1]&VP[0]);
		
		
		// slow clock 0.5s for blincking LEDs
		wire slow_clock;
		clock_half_sec U0(clk,slow_clock);
		
		
		always @(posedge slow_clock)
			if (((P&VP[1]) | (P&VP[0]) | (Open&P) | (Open&VP[1]&VP[0])) == 1)
				begin
				LED<=~LED;
				end
			else
				begin
				LED<=7'b0000000;
				end
endmodule
