module Top_Module(
	input clk,//system clock 100 MHz
	input Up_Button, //top button for deposit
		input Down_Button,//bottom button for withdrawal
		input reset, //center button for resetting
	input [5:0] sw,//6 different bills ($1, $5, $10, $20, $50, $100)
	output [2:0] LED,//for errors and warnings
	output [3:0] an, //to enable the segments on Basys 3 board
	output [6:0] seg); //seven segment display


	parameter zero = 4'b0000;
	//all wires that connects output of submodules to input of other submodules
	wire clk_out; //100 Hz clock
	wire deposit; //triggered signal that indicates money was deposited into the bank
	wire withdrawal; //triggered signal that indicates money was withdrawn from the bank
	wire [3:0] mux_out; //output of the Multiplexer
	wire [1:0] counter_out; //output of the 2-bit counter
	wire [3:0] ones, tens, hundreds; //number that will be displayed onto the segment
	wire [7:0] amount_count; //Bill amount, $1, $5, etc.
	wire Up_deb, Down_deb; //debounced signal from the pushbuttons
	
	wire [7:0] amount; //displays the total balance/amount/count in the account, $0 to $255
	
	//#8 FPGA Project Playlist - Binary to BCD Conversion (lines 32 to 42)
	//https://youtu.be/YM8s4SfHBPU
	
	debounce U0(clk, Up_Button, Up_deb);
	
	debounce U1(clk, Down_Button, Down_deb);	
		
	Binary_BCD_Converter U2(amount_count, ones, tens, hundreds);
	
	four_to_one_Mux U3(ones, tens, hundreds, zero, counter_out, mux_out);
	
	SlowClock_100Hz U4(clk, clk_out);
	
	eight_bit_counter U5(clk_out, counter_out);
	
	Decoder U6(counter_out, an);
	
	BCD_Seven_Segment U7(mux_out, seg);
	
	//lines 45 and 47, triggered signal indicating whether money is deposited or withdrawn 
	Deposit U8(clk, reset, Up_deb, deposit);
	
	Withdraw U9(clk, reset, Down_deb, withdrawal);
	
	//Lines 49,52, ATM Functioning, led warning in case of overflows
	counter U10(clk, reset, deposit, withdrawal, amount, amount_count, LED[1], LED[2]);

	ATM U11(sw, amount, LED[0]);
		
endmodule

