module pwm(clk, data_in, load, pwm_out);

	input clk;
	input [9:0] data_in;
	input load;
	output pwm_out;
	
	reg [9:0] d;
	reg [9:0] count;
	reg pwm_out;
	
	initial count = 10'b0;
	
	always @ (posedge clk)
		if (load == 1'b1) d <= data_in;
	
	always @ (posedge clk) begin
		count <= count + 1'b1;
		if (count > d)
			pwm_out <= 1'b0;
		else
			pwm_out <= 1'b1;
		end
		
endmodule

