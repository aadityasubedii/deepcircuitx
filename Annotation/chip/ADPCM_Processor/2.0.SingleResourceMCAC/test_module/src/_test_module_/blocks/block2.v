always @( posedge reset, posedge clk ) begin
	if (reset) begin
		phy_rst_reg <= 'd0;
	end else begin
	    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TEST_PHY_RST )
		  phy_rst_reg <= wb_wdata32[0];     
	end
end