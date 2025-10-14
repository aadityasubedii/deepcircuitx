if (HIGHEST_LANE > 1)
 assign _phy_ctl_wd = {phy_ctl_wd[31:23], data_offset, phy_ctl_wd[16:0]};
if (HIGHEST_LANE == 1)
 assign _phy_ctl_wd = phy_ctl_wd;