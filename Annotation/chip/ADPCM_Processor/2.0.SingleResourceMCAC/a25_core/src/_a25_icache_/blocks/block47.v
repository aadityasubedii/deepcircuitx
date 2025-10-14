always@(posedge reset, posedge clk) begin
	if (reset) begin
		read_buf_data_r <= 'd0;
		read_buf_addr_r <= 'd0;
		read_buf_valid_r <= 'd0;
	end else begin
		if ( i_cache_flush ) begin
			read_buf_valid_r <= 1'd0;
		end else if (i_wb_ready && c_state == CS_FILL3) begin
			read_buf_data_r  <= i_wb_read_data;
			read_buf_addr_r  <= miss_address;
			read_buf_valid_r <= 1'd1;
		end else if (o_wb_req) begin
			read_buf_valid_r <= 1'd0;
		end
	end
end