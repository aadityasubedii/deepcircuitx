	always @(Clear, next_state_R)
	begin
		if (Clear == 1'b1)
			pr_state_R <= initial_state;
		else
			pr_state_R <= next_state_R;
	end