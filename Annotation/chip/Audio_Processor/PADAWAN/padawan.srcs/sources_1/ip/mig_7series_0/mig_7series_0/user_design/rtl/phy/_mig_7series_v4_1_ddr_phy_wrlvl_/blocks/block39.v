   assign dbg_phy_wrlvl[0+:27]  = corse_cnt_dbg;
   assign dbg_phy_wrlvl[27+:5]  = wl_state_r;
   assign dbg_phy_wrlvl[32+:4]  = dqs_count_r;
   assign dbg_phy_wrlvl[36+:9]  = rd_data_rise_wl_r;
   assign dbg_phy_wrlvl[45+:9]  = rd_data_previous_r;
   assign dbg_phy_wrlvl[54+:4]  = stable_cnt;
   assign dbg_phy_wrlvl[58]     = 'd0;
   assign dbg_phy_wrlvl[59]     = flag_ck_negedge;