  always @(posedge clk) begin
    if (rst) begin
	  stg3_left_lim       <= #TCQ 'd0;
	  simp_stg3_left_lim  <= #TCQ 'd0;
	  cmplx_stg3_left_lim <= #TCQ 'd0;
	end else if (stg3_inc2init_val_r && !stg3_inc2init_val_r1) begin
	  stg3_left_lim <= #TCQ stg3_tap_cnt;
	  if (oclkdelay_calib_done)
	    cmplx_stg3_left_lim[oclkdelay_calib_cnt*6+:6] <= #TCQ stg3_tap_cnt;
	  else
	    simp_stg3_left_lim[oclkdelay_calib_cnt*6+:6] <= #TCQ stg3_tap_cnt;
	end else if (lim_start && !lim_start_r)
	  stg3_left_lim <= #TCQ 'd0;
  end