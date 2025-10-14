	always @ (s_clk) begin
		if (rst) begin
			LR_count <= 0;
			LR_clk <= 0;
		end
		else if (s_clk == 0) begin      
		
		
			if (LR_count < (DIN_W-1) * LR_SAM) begin
				LR_count <= LR_count + 1;
			end
			else begin
				LR_count <= 0;
				LR_clk <= ~LR_clk;
			end
		end
		else
			begin
			LR_count <= LR_count;
			LR_clk <= LR_clk;
			end
	end