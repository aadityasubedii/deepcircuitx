	always @(posedge sample_clock)
	begin
		output_sample = divdelay + input_sample;
	end