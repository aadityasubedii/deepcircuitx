  always @ (posedge clk) begin
    if_empty_reg <= #TCQ  phy_if_empty;
    pi_stg2_en_reg <= #TCQ pi_en_stg2_f;
  end