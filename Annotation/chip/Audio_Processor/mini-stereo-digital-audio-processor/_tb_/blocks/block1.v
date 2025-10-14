	always @(negedge Sclk)
	begin
		if (OutReady)
		begin
			writeL[l] = OutputL_reg ;
			writeR[l] = OutputR_reg ;
			OutputL = OutputL_reg ;
			OutputR = OutputR_reg;
			l = l - 1;
			if (l < 0 && count < 6395 )
			begin
				if(count!=3798 && count!= 5397)
				$fwrite (mv, "   %h      %h\n", writeL, writeR);
				count=count+1;
				l = 39;
			
			end
		end
	end