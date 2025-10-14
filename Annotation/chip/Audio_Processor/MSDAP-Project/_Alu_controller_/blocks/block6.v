	always @(Clear, next_state_L)
	begin
		if (Clear == 1'b1)
			pr_state_L <= initial_state;
		else
			pr_state_L <= next_state_L;
	end