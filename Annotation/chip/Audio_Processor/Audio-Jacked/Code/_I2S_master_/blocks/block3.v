	always @ (posedge clk) begin
		if (rst) m_clk <= 0;
		else m_clk <= ~m_clk;
	end	