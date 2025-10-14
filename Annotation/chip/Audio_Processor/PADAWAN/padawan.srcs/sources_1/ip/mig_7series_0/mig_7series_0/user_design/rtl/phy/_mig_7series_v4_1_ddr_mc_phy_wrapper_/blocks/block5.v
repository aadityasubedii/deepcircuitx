  assign phy_ctl_wd_temp = (nCK_PER_CLK == 4) ? phy_ctl_wd_i2 : phy_ctl_wd_of;
  assign phy_ctl_wr_temp = (nCK_PER_CLK == 4) ? phy_ctl_wr_i2 : phy_ctl_wr_of;
  assign data_offset_1_temp = (nCK_PER_CLK == 4) ? data_offset_1_i2 : data_offset_1_of;
  assign data_offset_2_temp = (nCK_PER_CLK == 4) ? data_offset_2_i2 : data_offset_2_of;
