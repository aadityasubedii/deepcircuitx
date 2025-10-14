  always @(posedge clk) begin
    if (rst || (init_state_r == INIT_REFRESH) || prbs_rdlvl_done || ocal_last_byte_done || oclkdelay_center_calib_done)
	  oclkdelay_ref_cnt <= #TCQ REFRESH_TIMER;
	else if (oclkdelay_calib_start_int) begin
	  if (oclkdelay_ref_cnt > 'd0)
	    oclkdelay_ref_cnt <= #TCQ oclkdelay_ref_cnt - 1;
	  else
	    oclkdelay_ref_cnt <= #TCQ REFRESH_TIMER;
	end
  end