  always @(posedge clk_i) begin
    phy_if_empty_r <= #TCQ phy_if_empty;
  end