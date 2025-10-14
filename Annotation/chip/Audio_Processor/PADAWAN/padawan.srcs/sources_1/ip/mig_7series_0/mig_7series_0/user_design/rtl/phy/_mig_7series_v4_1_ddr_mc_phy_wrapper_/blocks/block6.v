  always @(posedge clk) begin
    phy_ctl_wd_i1 <= #TCQ phy_ctl_wd;
    phy_ctl_wr_i1 <= #TCQ phy_ctl_wr;
    phy_ctl_wd_i2 <= #TCQ phy_ctl_wd_i1;
    phy_ctl_wr_i2 <= #TCQ phy_ctl_wr_i1;
    data_offset_1_i1 <= #TCQ data_offset_1;
    data_offset_1_i2 <= #TCQ data_offset_1_i1;
    data_offset_2_i1 <= #TCQ data_offset_2;
    data_offset_2_i2 <= #TCQ data_offset_2_i1;
  end