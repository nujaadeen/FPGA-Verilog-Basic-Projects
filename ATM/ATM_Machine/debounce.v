module debounce(
	input clk,
	input pushbutton,
	output pulse_out);

	reg [11:0] count;
	reg new_press;
	reg stable;
	reg now_stable;

	always @(posedge clk) begin
		if (pushbutton == new_press) begin
			if (count == 4095)
				stable <= pushbutton;
			else
				count <= count + 1;
		end
		
		else begin
			count <= 0;
			new_press <= pushbutton;
		end
   end


   always @(posedge clk) begin
         now_stable <= stable;
   end
 
   //Sends one shot pulse out if stable
   assign pulse_out = (now_stable == 0 & stable == 1);
   
endmodule