always @(posedge reset, posedge clk) begin
	if (reset) begin
		wbuf_wdata_r[0] <= 'd0;
		wbuf_wdata_r[1] <= 'd0; 
		wbuf_addr_r[0] <= 'd0;
		wbuf_addr_r[1] <= 'd0; 
		wbuf_be_r[0] <= 'd0;
		wbuf_be_r[1] <= 'd0; 
		wbuf_write_r <= 'd0;
		wbuf_wp_r <= 'd0;
	end else begin
		if (push) begin
			wbuf_wdata_r [wbuf_wp_r]   <= i_wdata;
			wbuf_addr_r  [wbuf_wp_r]   <= i_addr;
			wbuf_be_r    [wbuf_wp_r]   <= i_write ? i_be : 16'hffff;
			wbuf_write_r [wbuf_wp_r]   <= i_write;
			wbuf_wp_r                  <= !wbuf_wp_r;
		end
	end
end