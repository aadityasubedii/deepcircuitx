	always @ (posedge div_clk) begin
		if (menu == 2'b01) begin	
			if (i > 19 || i < 0)
				i <= 0;
			else i <= i + 1;
		end
		else i <= 0;
	end