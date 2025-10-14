	always @(posedge clk)
	begin
		if (rst)
			glyph[7:0] <= 'd0;
		else
			glyph [7:0] <= {hcnt[3:0], vcnt[3:0]};
	end