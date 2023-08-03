`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 07:53:26 PM
// Design Name: 
// Module Name: Slow_Clock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Slow_Clock_100Hz(
    input clk_in, // input clock which is 100 mHz from the Basys 3 board
    output reg clk_out // slow clock at 100 Hz frequency 
    );
    
    reg[20:0] period_count = 0;
    
    always @(posedge clk_in)
        if(period_count != 500000 - 1) //if the statement is not true, period_count cnot equivalent to 499999
            begin
                period_count <= period_count + 1; //increment period_count by 1
                clk_out <=0; //clk_out gets set to 0
            end
        else
            begin
                period_count <=0; // reset count to 0
                clk_out <= 1; // clk_out gets set to 1
            end
    endmodule
    
    // Previous code
    //reg [24:0] count=0; // 2 power 20, 104856
    
    //always @(posedge clk_in) // whenever the positive edge of the clock arrives
    //begin
    //count<=count+1; // counter incremented by 1
    //if (count==50_000_000) // once the counter reaches the value of 50,000,000
    //begin
    //count<=0; //counter should reset itself
    //clk_out = ~clk_out; //clock signal should invert
    //end
    //end
