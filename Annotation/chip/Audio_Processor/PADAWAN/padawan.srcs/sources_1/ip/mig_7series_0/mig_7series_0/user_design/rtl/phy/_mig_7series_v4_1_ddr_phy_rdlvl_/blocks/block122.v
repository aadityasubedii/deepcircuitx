  assign dbg_phy_rdlvl[40:25]  = 'b0;
  assign dbg_phy_rdlvl[41]     = sr_valid_r;
  assign dbg_phy_rdlvl[42]     = found_stable_eye_r;