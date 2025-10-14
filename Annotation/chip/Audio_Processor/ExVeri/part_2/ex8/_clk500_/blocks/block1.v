	always @ (posedge en)
	begin
			if (count == 9'b111110100) 
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