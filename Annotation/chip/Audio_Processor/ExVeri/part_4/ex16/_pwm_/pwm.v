module pwm (clk, data_in, load, pwm_out);

	input				clk;			// system clock
	input [9:0] 	data_in;		// input data for conversion
	input 			load;			// high pulse to load new data
	output			pwm_out;		// PWM output

	reg [9:0]		d;				// internal register
	reg [9:0]		count;		// internal 10-bit counter
	reg				pwm_out;

	always @ (posedge clk)
		if (load == 1'b1) d <= data_in;
	
	initial count = 10'b0;	
	
	always @ (posedge clk) begin
		count <= count + 1'b1;
		if (count > d)
			pwm_out <= 1'b0;
		else	
			pwm_out <= 1'b1;
		end

endmodule
