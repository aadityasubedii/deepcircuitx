	always @ (posedge sysclk)
	begin
		if(trigger==1'b1)
		begin
			if(count==n)
				time_out <= 1'b1;
			else
				count <= count + 1'b1;
		end
		else
		begin
				count <= 0;
				time_out <= 0;
		end
	end