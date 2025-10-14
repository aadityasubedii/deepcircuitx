  assign dbg_calib_top[0] = pi_stg2_en_reg ;
  assign dbg_calib_top[1] = if_empty_reg ;
  assign dbg_calib_top[3]     = coarse_dec_err;
  assign dbg_calib_top[4]     = calib_tap_inc_start;
  assign dbg_calib_top[5]     = calib_tap_inc_done;
  assign dbg_calib_top[6+:63] = dbg_skip_cal;