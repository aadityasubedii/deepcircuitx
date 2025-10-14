	always @ (posedge clkin)
	begin
		if(en == 1'b1)
		begin
			if(count == 16'b0)
			begin
				tick <= 1;
				count <= (K - 16'b1);
			end
			else
			begin
				count <= count - 1'b1;
				tick <= 0;
			end
		end
	end