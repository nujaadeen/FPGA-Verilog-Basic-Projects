`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2021 04:51:53 PM
// Design Name: 
// Module Name: Parking_System
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


module Parking_System(
input clock, //Basys 3 FPGA Board clock, 100 MHz
input [4:0] parking_slots, //These are the parking slots available, total of 5 slots
output reg [4:0] parking_slots_available, //One led each that indicates whether car is parked or not
output  [6:0] seg, //seven segment display for indicating when parking space is open or full
output reg [3:0] an
    );
    
  reg [3:0] display; //declaring display (Open or Full) as register
    seven_seg ss0(display,seg); //instantiating the seven segment module
    // to enable seven segments and siplay character
    
   
   wire slowclock_100Hz; //slow clock to toggle the seven segments
   slowclock_100Hz sclk(clock, slowclock_100Hz);
   
   reg [1:0] enable=0; //declaring the 4 enable, one each for each segment as register
    
   //If a parking slot is occupied turn the led OFF, else if emply then Led is ON
    always@(parking_slots)
    begin
    case(parking_slots)
    0:parking_slots_available=5'b11111;//All parking slots led light will be ON
    1:parking_slots_available=5'b11110;
    2:parking_slots_available=5'b11101;
     3:parking_slots_available=5'b11100;
      4:parking_slots_available=5'b11011;
       5:parking_slots_available=5'b11010;
        6:parking_slots_available=5'b11001;
         7:parking_slots_available=5'b11000;
          8:parking_slots_available=5'b10111;
           9:parking_slots_available=5'b10110;
            10:parking_slots_available=5'b10101;
             11:parking_slots_available=5'b10100;
              12:parking_slots_available=5'b10011;
               13:parking_slots_available=5'b10010;
                14:parking_slots_available=5'b10001;
                 15:parking_slots_available=5'b10000;
     16:parking_slots_available=5'b01111;
      17:parking_slots_available=5'b01110;
       18:parking_slots_available=5'b01101;
        19:parking_slots_available=5'b01100;
         20:parking_slots_available=5'b01011;
          21:parking_slots_available=5'b01010;
      22:parking_slots_available=5'b01001;
       23:parking_slots_available=5'b01000;
        24:parking_slots_available=5'b00111;
         25:parking_slots_available=5'b00110;
          26:parking_slots_available=5'b00101;
           27:parking_slots_available=5'b00100;
            28:parking_slots_available=5'b00011;
             29:parking_slots_available=5'b00010;
              30:parking_slots_available=5'b00001;
               31:parking_slots_available=5'b00000;
                  endcase
end
   //creating a counter to toggle the four seven segments
   always @ (posedge slowclock_100Hz)
    begin

   enable <= enable + 1;
end

//enabling one segment at a time and dsiplaying the character
   always @ (posedge slowclock_100Hz)
 begin
 //if all parking slots are occupied, if this statement below is true
 if (parking_slots[0] & parking_slots[1] & parking_slots[2] & parking_slots[3] & parking_slots[4])
 begin
 //What happens when a specific segment is ON 
 case(enable)
    2'b00 : 
    begin
     display = 0;//right most seven segment should display L
     an = 4'b1110; //right most seven segment display is enabled
        end
    
   2'b01:
    begin
     display = 0;//second righ most segment should display L
     an = 4'b1101;//second righ most segment is enabled
    end
    
   2'b10:
    begin
     display = 1;//second left most segment should display U
     an = 4'b1011;//second left most segment is enabled
    end
     
   2'b11:
    begin
     display = 2;//left most segment should display F
     an = 4'b0111;//// left most segment is enabled
    end
  endcase
  end
  //else if the below statement is true then....
  else if ((parking_slots[0] & parking_slots[1] & parking_slots[2] & parking_slots[3] & parking_slots[4])!=1)
  begin
  case(enable)
    2'b00: 
    begin
     display = 6;//right most seven segment should display n
     an = 4'b1110; //right most seven segment display is enabled
        end
    
   2'b01:
    begin
     display = 5;//second righ most segment should display E
     an = 4'b1101;//second righ most segment is enabled
    end
    
   2'b10:
    begin
     display = 4;
     an = 4'b1011;
    end
     
   2'b11:
    begin
     display = 3;//left most segment should display O
     an = 4'b0111;// left most segment is enabled
    end
  endcase
 end
 end

endmodule
