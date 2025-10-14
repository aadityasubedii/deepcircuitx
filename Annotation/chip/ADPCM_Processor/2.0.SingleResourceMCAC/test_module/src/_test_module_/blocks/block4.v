always @( posedge reset, posedge clk ) begin
	if (reset) begin
		mem_ctrl_reg <= 'd0;
	end else begin
		if ( wb_start_write && i_wb_adr[15:0] == AMBER_TEST_MEM_CTRL )
			mem_ctrl_reg <= wb_wdata32[0];
	end
end 