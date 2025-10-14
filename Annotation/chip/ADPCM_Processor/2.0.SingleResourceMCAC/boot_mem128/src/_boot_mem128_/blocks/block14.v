	always @( posedge reset, posedge clk ) begin
		if (reset) begin
			start_read_r <= 'd0;
		end else begin
			if (start_read)
				start_read_r <= {3'd0, start_read};
			else if (o_wb_ack)
				start_read_r <= 'd0;
			else
				start_read_r <= {start_read_r[2:0], start_read};
		end
	end