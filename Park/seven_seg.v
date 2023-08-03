`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2021 05:32:03 PM
// Design Name: 
// Module Name: seven_seg
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


module seven_seg(
input [3:0] display,
output reg [6:0] seg
    );
    
    always@(display)
    begin
    case(display)
    0:seg=7'b1110001; //"L" 0-->ON, 1--OFF
    1:seg=7'b1000001; //"U"
    2:seg=7'b0111000;// "F"
    3:seg=7'b0000001; //"O"
    4:seg=7'b0011000; //"P"
    5:seg=7'b0110000; //"E"
    6:seg=7'b1101010; //"n"
    endcase
    
    end
endmodule
