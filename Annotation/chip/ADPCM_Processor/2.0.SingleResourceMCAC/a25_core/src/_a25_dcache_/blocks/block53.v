always @ (posedge reset, posedge clk) begin
	if (reset) begin
		ex_read_address <= 'd0;
	end else begin
		if ( ex_read_hit ) begin
			ex_read_address <= i_address[CACHE_ADDR32_MSB:CACHE_ADDR32_LSB];
		end
	end
end