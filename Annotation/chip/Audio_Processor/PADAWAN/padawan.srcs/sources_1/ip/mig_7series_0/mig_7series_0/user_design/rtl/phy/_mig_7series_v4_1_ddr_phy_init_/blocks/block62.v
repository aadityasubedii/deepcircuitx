  always @(posedge clk) begin
    rdlvl_wr_r      <= #TCQ rdlvl_wr;
    calib_wrdata_en <= #TCQ phy_wrdata_en;
  end 