  always @(posedge clk)
    phy_if_empty_r <= #TCQ phy_if_empty;
