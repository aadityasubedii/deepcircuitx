always @( posedge i_clk )
    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TEST_PHY_RST )
        phy_rst_reg <= wb_wdata32[0];     
