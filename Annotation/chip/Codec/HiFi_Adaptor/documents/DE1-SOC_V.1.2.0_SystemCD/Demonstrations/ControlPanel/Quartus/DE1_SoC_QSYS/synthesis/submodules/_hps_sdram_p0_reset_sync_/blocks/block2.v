		always @(posedge clk or negedge reset_n)
		begin
			if (~reset_n)
				reset_reg[i] <= 1'b0;
			else
			begin
				if (i==0)
					reset_reg[i] <= 1'b1;
				else if (i < RESET_SYNC_STAGES)
					reset_reg[i] <= reset_reg[i-1];
				else
					reset_reg[i] <= reset_reg[RESET_SYNC_STAGES-2];
				
			end
		end