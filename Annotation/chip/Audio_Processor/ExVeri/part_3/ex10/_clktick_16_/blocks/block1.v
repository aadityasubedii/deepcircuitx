	always @ (posedge clkin)
	begin
			if (count == 3'd500) 
			begin 
				tick <= 1'b1;
				count <= 0; 
			end
			else
			begin
				count <= count + 1'b1;
				tick <= 1'b0;	
			end
	end