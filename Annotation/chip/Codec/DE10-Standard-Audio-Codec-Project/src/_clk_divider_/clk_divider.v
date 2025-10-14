/*
The clk_divider module divides the provided 50 MHz clock ADC_CLK_10
by 10_000_000 to create 1 Hz clock to use with the displays on the
DE10 Standard board. Adapted from ECEN 2350.
*/

module clk_divider(input main_clock, output CLOCK_1_HZ );


reg [23:0] divide = 25; 



//parameter clock_divider = divide;  // Clock divider is one half of the desired division. The slow clock toggles twice per period
reg [23:0] divide_counter;

reg slow_clock;

// create 1 Hz clock

always @(posedge main_clock) // Checks for a rising edge on clock signal or a falling edge on reset signal
begin
    if (divide_counter == divide - 1)    // Check if the divide_counter has reached one less than the clock_divider number.
    begin
        divide_counter <= 0;            // Start the divide_counter over at zero.
        slow_clock <= ~slow_clock;      // Toggle the slow clock.
    end
    else
        divide_counter <= divide_counter + 1;   // If the divide_counter hasn't counted all the way up, then increment the divide_counter by 1.
end
		 
assign CLOCK_1_HZ = slow_clock;

endmodule


