	always @(negedge Sclk or negedge Reset_n)		
	begin
		if (!Reset_n)
		begin
			if (pr_state > 4'd4)
				pr_state = Reset;
			else
				pr_state = next_state;
		end
		else
		pr_state = next_state;
	end