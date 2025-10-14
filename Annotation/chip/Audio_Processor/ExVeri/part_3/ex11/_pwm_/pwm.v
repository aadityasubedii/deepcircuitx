module pwm(CLOCK_50, SW, load, pwm_out);

	input	CLOCK_50; //system clock
	input [9:0] SW; //input data for conversion
	input load;//high pulse to load
	output pwm_out; //PWM output
	
	reg [9:0] d; //internal register
	reg [9:0] count; //internal 10-bit counter
	reg pwm_out;
	
	always @ (posedge CLOCK_50)
		if (load == 1'b1) d <= SW;
	
	initial count = 10'b0;
		
	always @ (posedge CLOCK_50) begin
		count <= count + 1'b1;
		if(count > d)
			pwm_out <= 1'b0;
		else
			pwm_out <= 1'b1;
		end
endmodule
	