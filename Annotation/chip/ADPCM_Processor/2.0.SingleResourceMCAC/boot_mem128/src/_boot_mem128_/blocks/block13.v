	always @( posedge reset, posedge clk ) begin
		if (reset) begin
			start_read_r <= 'd0;
		end else begin
			start_read_r <= start_read;
		end
	end