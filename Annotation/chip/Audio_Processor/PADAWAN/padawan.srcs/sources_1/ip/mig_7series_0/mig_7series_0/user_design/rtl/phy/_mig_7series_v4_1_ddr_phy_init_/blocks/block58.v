      always @(*)
        if((rdlvl_wr & ~phy_ctl_full & new_burst_r & ~phy_data_full) 
             | phy_wrdata_en_r1)
          phy_wrdata_en = 1'b1;
        else
          phy_wrdata_en = 1'b0;
