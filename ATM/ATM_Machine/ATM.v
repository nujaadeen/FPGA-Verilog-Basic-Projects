`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2021 08:47:49 PM
// Design Name: 
// Module Name: ATM
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

module ATM(
    input [5:0] switch, //6 different Bills ($1, $5, $10, $20,$50, $100)
    output [7:0] amount, //dollar money inserted into the ATM Machine
    output LED //this just indicates if you have more than one dollar amount entered.
    );
    
    reg [7:0] bill_amount = 8'b00000000; //will assign values here...
    
    //only one switch in up position at a time. Else warning led light will turn on.
    always @(switch)
    begin
        case(switch) //amount depends upon the switch
            1: bill_amount = 8'b00000001; // $1, if sw[0] is high
            2: bill_amount = 8'b00000101; // $5, if sw[2] is high
            4: bill_amount = 8'b00001010; // $10, if sw[4] is high
            8: bill_amount = 8'b00010100; // $20 sw[6]
            16: bill_amount = 8'b00110010; // $5000
            32: bill_amount = 8'b01100100; // $100, if sw10 is high
            default: bill_amount = 8'b00000000; // $0 
        endcase
    end
    
    assign amount = bill_amount;
    
    ////only one switch in up position at a time. Else warning led light will turn on.
    reg active = 1'b0; 
        
    always @(switch)
    begin
        case(switch)
            0: active = 1'b0; // $0
            1: active = 1'b0; // $1
            2: active = 1'b0; // $5
            4: active = 1'b0; // $10
            8: active = 1'b0; // $20 (1000)
            16: active = 1'b0; // $50 (1000 0000)
            32: active = 1'b0; // $100
            default: active = 1'b1; // $0 
        endcase
    end
    
    assign LED = active;
    
endmodule
