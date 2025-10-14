	always @(posedge Sclk)
	begin
		if (OutReady)
		begin
			writeL[i] = OutputL_beh ^ OutputL_rtl;
			writeR[i] = OutputR_beh ^ OutputR_rtl;
			OutputL = OutputL_beh ^ OutputL_rtl;
			OutputR = OutputR_beh ^ OutputR_rtl;
			i = i - 1;
			if (i < 0)
			begin
				$fmonitor(fp, "%H\t %H\n", writeL, writeR);
				i = 39;
				if (!(writeL == 40'd0 && writeR == 40'd0))
					mismatches = mismatches + 1'b1;
			end
		end
	end