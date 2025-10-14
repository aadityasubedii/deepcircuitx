	always @ (posedge CLOCK_50)
	begin		
			if (reset_count == 16'd1023)
				reset_count <= 1'b1;
			else
				reset_count <= 1'b0;
	end