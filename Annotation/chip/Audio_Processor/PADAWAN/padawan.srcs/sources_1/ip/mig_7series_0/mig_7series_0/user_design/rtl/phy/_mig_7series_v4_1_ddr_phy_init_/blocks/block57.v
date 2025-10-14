      always @(posedge clk)
        phy_wrdata_en_r1 <= #TCQ rdlvl_wr & ~phy_ctl_full & new_burst_r
                                 & ~phy_data_full;
    