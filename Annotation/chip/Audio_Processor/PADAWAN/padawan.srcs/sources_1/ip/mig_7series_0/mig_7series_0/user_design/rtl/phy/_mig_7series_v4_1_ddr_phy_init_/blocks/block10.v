  always @(posedge clk)
    phy_data_full_r <= #TCQ phy_data_full;
