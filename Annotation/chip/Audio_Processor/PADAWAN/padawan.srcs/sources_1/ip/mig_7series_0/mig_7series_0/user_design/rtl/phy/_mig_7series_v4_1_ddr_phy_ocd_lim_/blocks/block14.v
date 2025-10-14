  assign dbg_ocd_lim[0+:DQS_WIDTH*6]    = simp_stg3_left_lim[DQS_WIDTH*6-1:0];
  assign dbg_ocd_lim[54+:DQS_WIDTH*6]   = simp_stg3_right_lim[DQS_WIDTH*6-1:0];
  assign dbg_ocd_lim[255:108]           = 'd0;