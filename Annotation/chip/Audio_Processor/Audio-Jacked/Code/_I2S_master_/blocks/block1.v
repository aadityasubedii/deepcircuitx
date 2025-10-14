	always @ (posedge clk) begin
		if (rst) begin
			s_count <= 0;
			s_clk <= 0;
		end
		else begin 
			if (s_count < s_max) begin
				s_count <= s_count + 1;
			end
			else begin
				s_count <= 0;
				s_clk <= ~s_clk;
			end
		end
	end