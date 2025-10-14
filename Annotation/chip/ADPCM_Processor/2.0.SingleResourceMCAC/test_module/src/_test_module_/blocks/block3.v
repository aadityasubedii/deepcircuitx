always @( posedge reset, posedge clk ) begin
	if (reset) begin
		led_reg <= 'd0;
	end else begin
		if ( wb_start_write && i_wb_adr[15:0] == AMBER_TEST_LED )
			led_reg <= wb_wdata32[3:0];
	end
end