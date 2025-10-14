	always @(posedge clk or negedge reset_n)
		if (!reset_n)
			count <= RESET_VALUE[WORD_LENGTH-1:0];
		else
		   count <= (restart_count) ? reset_value :
                    (enable_count) ? (count < max_count) ? count + 1'b1 : {(WORD_LENGTH){1'b0}} : count;					