    assign _phy_ctl_wd     = phy_ctl_wd;
    assign aux_in_[1]      = aux_in_1;
    assign aux_in_[2]      = aux_in_2;
    assign phy_ctl_a_full  = |_phy_ctl_a_full_p;
    assign phy_ctl_full[0] = |_phy_ctl_full_p;
    assign phy_ctl_full[3:1] = 3'b000;
    assign _phy_clk        = phy_clk;