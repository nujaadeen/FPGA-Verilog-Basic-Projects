`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 08:20:03 PM
// Design Name: 
// Module Name: four_one_Mux
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


module four_to_one_Mux(
    input [3:0] A,
    input [3:0] B,
    input [1:0] C,
    input [3:0] D,
    input [1:0] SS,
    output [3:0] Y 
    );
    
    // selector switches decide what data at the input data lines go through to output Y
    assign Y = (SS==0)?A : (SS==1)?B : (SS==2)?C : D;
    
    // previous code
    //always @(A or B or C or D or SS)
    //begin
    //case(SS)
    //2'b00: Y = A;
    //2'b01: Y = B;
    //2'b10: Y = C;
    //2'b11: Y = D;
    //endcase
    //end
    
    
endmodule
