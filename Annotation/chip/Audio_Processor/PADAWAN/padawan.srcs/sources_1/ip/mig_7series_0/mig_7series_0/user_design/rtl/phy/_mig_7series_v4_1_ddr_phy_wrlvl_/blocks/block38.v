   assign dbg_phy_wrlvl [60]    = wl_edge_detect_valid_r;
   assign dbg_phy_wrlvl [61+:6] = wl_tap_count_r;
   assign dbg_phy_wrlvl [67+:9] = rd_data_edge_detect_r;
   assign dbg_phy_wrlvl [76+:54]  = wl_po_fine_cnt;
   assign dbg_phy_wrlvl [130+:27] = wl_po_coarse_cnt;