	always @( posedge reset, posedge clk ) begin
		if (reset) begin
			start_read_d1 <= 'd0;
			start_read_d2 <= 'd0;
			wb_rdata128 <= 'd0;
		end else begin
			start_read_d1   <= start_read;
			start_read_d2   <= start_read_d1;
			if ( start_read_d1 ) begin
				wb_rdata128 <= rd_data;
			end
		end
	end