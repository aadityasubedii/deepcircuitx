 	always @(Start, negedge Dclk)		
	begin
		if (Start == 1'b1)
			pr_state <= Startup;
		else
			pr_state <= next_state;
	end