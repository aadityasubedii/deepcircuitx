	always @(posedge clk)
		begin
			if (!enable)
				data_out <= data_in;
			else begin
				data_out[RESOLUTION - SHIFT - 1] <= |data_in[RESOLUTION-1:RESOLUTION - SHIFT - 1];
				data_out <= data_in << SHIFT;
			end
		end