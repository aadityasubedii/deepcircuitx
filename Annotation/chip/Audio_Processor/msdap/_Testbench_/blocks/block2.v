	always @(posedge Dclk)
	begin
		if ((((j == 9458) || (j == 13058)) && reset_flag == 1'b0))
		begin
			Reset_n = 1'b0;
			reset_flag = 1'b1;
			



		end
		else if (InReady || reset_flag)
		begin
			if (j < 15056)
			begin
				Reset_n = 1'b1;
				if (k == 15)
					Frame = 1'b1;
				else
					Frame = 1'b0;
				if (k >= 0)
				begin
					InputL = data[j][k];
					InputR = data[j+1][k];
					
					k = k - 1;
				end
				if (k == -1)
				begin
					k = 15;
					j = j + 2;
					if (reset_flag)
						reset_flag = 1'b0;
				end
			end
		end
	end