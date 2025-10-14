  always @(posedge clk)
    if (rst || (init_state_r == INIT_WRCAL_WRITE))
	  calib_tap_end_if_reset <= #TCQ 1'b0;
	else if (calib_tap_inc_done && ~calib_tap_inc_done_r1)
	  calib_tap_end_if_reset <= #TCQ 1'b1;
