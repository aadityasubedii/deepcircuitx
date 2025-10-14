  assign pi_stg2_f_incdec = (calib_pi_f_incdec | dbg_pi_f_inc_r | rdlvl_pi_stg2_f_incdec | prbs_pi_stg2_f_incdec | tempmon_pi_f_inc_r);
  assign pi_en_stg2_f     = (calib_pi_f_en | dbg_pi_f_en_r | rdlvl_pi_stg2_f_en | prbs_pi_stg2_f_en | tempmon_pi_f_en_r);

  assign idelay_ce  = (idelay_ce_r2 | calib_idelay_ce);
  assign idelay_inc = (idelay_inc_r2 | calib_idelay_inc);