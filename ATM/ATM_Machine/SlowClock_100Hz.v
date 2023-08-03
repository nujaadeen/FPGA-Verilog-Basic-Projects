`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2021 08:56:44 PM
// Design Name: 
// Module Name: SlowClock_100Hz
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


module SlowClock_100Hz(

   input clk_in, // input clock which is 100 mHz from the Basys 3 board
    output reg clk_out // slow clock at 100 Hz frequency 
    );
    
    reg[20:0] period_count = 0;
    
    always @(posedge clk_in)
        if(period_count != 20000 - 1) //if the statement is not true, period_count cnot equivalent to 499999
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

