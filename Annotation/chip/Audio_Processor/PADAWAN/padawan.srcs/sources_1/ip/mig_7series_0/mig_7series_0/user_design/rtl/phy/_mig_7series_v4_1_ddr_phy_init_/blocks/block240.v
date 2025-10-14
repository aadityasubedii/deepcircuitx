  assign dbg_phy_init[5:0] = init_state_r;
  assign dbg_phy_init[6+:8] = complex_row_cnt;
  assign dbg_phy_init[14+:3] = victim_sel;
  assign dbg_phy_init[17+:4] = victim_byte_cnt;
  assign dbg_phy_init[21+:9] = stg1_wr_rd_cnt[8:0]; 
  assign dbg_phy_init[30+:15]  = complex_address;
  assign dbg_phy_init[(30+15)+:15]  = phy_address[14:0];
  assign dbg_phy_init[60]  =prbs_rdlvl_prech_req ;