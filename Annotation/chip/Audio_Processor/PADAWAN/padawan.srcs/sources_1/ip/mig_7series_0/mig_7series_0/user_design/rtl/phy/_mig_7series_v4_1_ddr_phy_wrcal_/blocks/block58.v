  assign dbg_phy_wrcal[4:1]  = cal2_state_r1[3:0];
  assign dbg_phy_wrcal[5]    = wrcal_sanity_chk_err;
  assign dbg_phy_wrcal[6]    = wrcal_start;
  assign dbg_phy_wrcal[7]    = wrcal_done;
  assign dbg_phy_wrcal[8]    = pat_data_match_valid_r;
  assign dbg_phy_wrcal[13+:DQS_CNT_WIDTH]= wrcal_dqs_cnt_r;
  assign dbg_phy_wrcal[17+:5]  = not_empty_wait_cnt;
  assign dbg_phy_wrcal[22]     = early1_data;