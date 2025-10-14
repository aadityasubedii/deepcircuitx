  always @(posedge clk)
    mux_rd_valid_r <= #TCQ ~phy_if_empty;
