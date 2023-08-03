module counter (
    input clk,
    input reset,
    output [6:0] seg,
    output [3:0] an,
    output led
);
    parameter max_count = 100_000_000-1;
    wire counter_en;
    reg [26:0] counter_100M;
    reg [3:0]  counter_10;

    assign an = 4'b1110;
	 assign counter_en = counter_100M == 0;
    display_seven_segment DSS(counter_10, seg);

    always @(posedge clk) begin
       if (reset) 
       counter_100M <= 0;
       else if (counter_100M == max_count)
       counter_100M <= 0;
       else counter_100M <= counter_100M + 1'b1; 
    end

    always @(posedge clk) begin
        if (reset)
        counter_10<=0;
        else if (counter_en)
        if(counter_10 == 9)
        counter_10<=0;
        else counter_10<=counter_10 +1'b1;
    end

    assign led = counter_10==9;
endmodule