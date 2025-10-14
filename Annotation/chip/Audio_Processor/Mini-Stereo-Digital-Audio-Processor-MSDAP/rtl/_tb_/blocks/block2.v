	always @(posedge Dclk)
	begin
		if ((((m == 9458) || (m == 13058)) && flag_reset == 1'b0))
		begin
			Reset_n = 1'b0;
			flag_reset = 1'b1;
		end
		else if (InReady || flag_reset)
		begin
			if (m < 15056)
			begin
				Reset_n = 1'b1;
				if (n == 15 )
					Frame = 1'b1;
				else
					Frame = 1'b0;
				if (n >= 0)
				begin
					InputL = data[m][n];
					InputR = data[m+1][n];
					n = n - 1;
				end
				if (n == -1)
				begin
					n = 15;
					m = m + 2;
					if (flag_reset)
						flag_reset = 1'b0;
				end
			end
		end
	end