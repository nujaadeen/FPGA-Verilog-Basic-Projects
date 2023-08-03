`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2021 08:50:29 PM
// Design Name: 
// Module Name: four_to_one_Mux
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
`timescale 1ns / 1ps

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
    
endmodule

