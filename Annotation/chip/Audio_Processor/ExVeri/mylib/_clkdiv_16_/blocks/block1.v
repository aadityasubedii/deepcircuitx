	always @ (posedge clkin)
	begin
		if(en == 1'b1)
		begin
			if(count == 16'b0)
			begin
				clkout <= ~clkout;
				count <= ((K >> 1) - 1);
			end
			else
			begin
				count <= count - 1'b1;
			end
		end
	end