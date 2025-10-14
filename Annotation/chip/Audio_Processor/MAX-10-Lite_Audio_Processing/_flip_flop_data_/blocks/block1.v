always @(posedge clk)
	begin
		data_out <= data_hold;
		data_hold <= data_in;
	end