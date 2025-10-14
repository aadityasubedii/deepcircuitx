	always @ (posedge CLOCK_50) begin
		count <= count + 1'b1;
		if(count > d)
			pwm_out <= 1'b0;
		else
			pwm_out <= 1'b1;
		end