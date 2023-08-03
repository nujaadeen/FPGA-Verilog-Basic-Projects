`timescale 1ns / 1ps

module determineAmount(
    input [5:0] switch,
    output [7:0] amount,
    output LED
    );
    
    reg [7:0] c_amount = 8'b00000000; 
    
    
    always @(switch)
    begin
        case(switch)
            1: c_amount = 8'b00000001; // $1
            2: c_amount = 8'b00000101; // $5
            4: c_amount = 8'b00001010; // $10
            8: c_amount = 8'b00010100; // $20
            16: c_amount = 8'b00110010; // $50
            32: c_amount = 8'b01100100; // $100
            default: c_amount = 8'b00000000; // $0 
        endcase
    end
    
    assign amount = c_amount;
    
    reg active = 1'b0; 
    
    
    always @(switch)
    begin
        case(switch)
            0: active = 1'b0; // $0
            1: active = 1'b0; // $1
            2: active = 1'b0; // $5
            4: active = 1'b0; // $10
            8: active = 1'b0; // $20
            16: active = 1'b0; // $50
            32: active = 1'b0; // $100
            default: active = 1'b1; // $0 
        endcase
    end
    
    assign LED = active;
    
endmodule
