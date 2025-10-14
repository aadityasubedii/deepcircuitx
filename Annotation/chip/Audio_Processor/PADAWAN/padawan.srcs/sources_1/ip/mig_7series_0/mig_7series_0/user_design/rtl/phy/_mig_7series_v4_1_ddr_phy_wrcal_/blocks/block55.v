  assign dbg_phy_wrcal[88]     = early1_data_match_r;
  assign dbg_phy_wrcal[89]     = early2_data_match_r;
  assign dbg_phy_wrcal[90]     = wrcal_sanity_chk_r & pat_data_match_valid_r;
  assign dbg_phy_wrcal[91]     = wrcal_sanity_chk_r;
  assign dbg_phy_wrcal[92]     = wrcal_sanity_chk_done;