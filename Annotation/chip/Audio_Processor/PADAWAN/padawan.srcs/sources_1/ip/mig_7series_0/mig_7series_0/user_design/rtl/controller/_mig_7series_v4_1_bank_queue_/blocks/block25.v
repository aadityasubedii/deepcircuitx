`ifdef MC_SVA
  pass_open_bank: cover property (@(posedge clk) (~rst && pass_open_bank_ns));
  pass_open_bank_killed_by_maint: cover property (@(posedge clk)
     (~rst && accept_req && pass_open_bank_eligible &&
       maint_hit_this_bm && ~wait_for_maint_r_lcl));
  pass_open_bank_following_maint: cover property (@(posedge clk)
     (~rst && accept_req && pass_open_bank_eligible &&
        maint_hit_this_bm && wait_for_maint_r_lcl));
`endif