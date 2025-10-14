   always @ (posedge Sclk)
	begin
		OutReady_buff <= OutReady;
		if(OutReady_buff == 1'b1)
		begin
			out_data[0][ybt] = OutputL;
			out_data[1][ybt] = OutputR;
			ybt = ybt+1;
			if(ybt == 40)
			begin
				
				$fwrite (outfile,"%h\t%h\n",out_data[0],out_data[1] );
				ybt=0;
			end
		end
	end