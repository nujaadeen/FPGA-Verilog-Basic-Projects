`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 07:26:38 PM
// Design Name: 
// Module Name: Shift_Add3_algorithm
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


module Shift_Add3_algorithm(
    input [3:0] in, // four input
    output reg [3:0] out // four outputs
    );
    
    always @(in) // describing an event that should happen to input when a certain condition is set
    case(in) // descision instruction that executes the statement
    
    4'b0000: out<=4'b0000; // 0
    4'b0001: out<=4'b0001; // 1
    4'b0010: out<=4'b0010; // 2
    4'b0011: out<=4'b0011; // 3
    4'b0100: out<=4'b0100; // 4
    4'b0101: out<=4'b1000; // 5 - Adding 3 because 5 = 5 (8)
    4'b0110: out<=4'b1001; // 6 - Adding 3 because 6 > 5 (9)
    4'b0111: out<=4'b1010; // 7 - Adding 3 because 7 > 5 (10)
    4'b1000: out<=4'b1011; // 8 - Adding 3 because 8 > 5 (11)
    4'b1001: out<=4'b1100; // 9 - Adding 3 because 9 > 5 (12)
    default: out<=4'b0000;
    endcase
    
endmodule
