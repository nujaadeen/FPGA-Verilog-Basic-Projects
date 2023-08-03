`timescale 1ns / 1ps

module counter(
input clk,
input reset,//reset the account value to 0
input increment, //money has been deposited
input decrement, //money has been withdrawn
input [7:0] amount, //Bill amount ($1, $5, $10,....)
output [7:0] count, //total money in the account, $0-$255
output LED2, //exceeds maximum account value i.e. 255
output LED3 //don't have enough money to withdraw, not enough balance
);

reg[7:0] current_count = 0;//will do math here, addition if deposit, subtraction if withdraw

// computing the balance in account after deposit and withdrawal
//for example, if balance (count) is $0 and $5 bill is deposited (amount), and deposit signal is triggered
// the current count will display $0 + $5 = $5. 
always@(posedge clk) begin
    if(reset)
        current_count<=0; // reset count to 0
    else if(increment & (count + amount) > count) // else if(increment)
        current_count<= count + amount; // incremened count by amount
    else if(decrement & amount <= count)
        current_count<= count - amount; // decrement count by amount
    else
        current_count <= count; // if no input, count remains the same
end
    assign count = current_count; // assign current_count to count


reg set2 = 0;
    
// determine LED2, exceeds maximum account value i.e. 255
always@(posedge clk) begin
    if(reset)
        set2 <=0; // reset count to 0
    else if(increment & (count + amount) > count) // else if(increment)
        set2 <=0; 
    else if(decrement & amount <= count)
        set2 <=0; 
    else if(increment & (count + amount) < count) // try and increment but overflow occurs
        set2 <=1;
    else
        set2 <= LED2; // if no input, count remains the same
end
    assign LED2 = set2;


reg set3 = 0;
    
// determine LED3, don't have enough money to withdraw, enough balance in the account
always@(posedge clk) begin
    if(reset)
        set3 <=0; // reset count to 0
    else if(increment & (count + amount) > count) // else if(increment)
        set3 <=0; 
    else if(decrement & amount <= count)
        set3 <=0; 
    else if(decrement & amount > count) // try and decrement but underflow occurs
        set3 <=1; // decrement count by amount
    else
        set3 <= LED3; // if no input, count remains the same
end
    assign LED3 = set3;
    
endmodule

