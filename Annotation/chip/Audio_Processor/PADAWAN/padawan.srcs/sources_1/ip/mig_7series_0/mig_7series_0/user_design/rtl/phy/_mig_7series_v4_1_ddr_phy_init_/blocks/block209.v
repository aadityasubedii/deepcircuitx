  always @(posedge clk) begin
    if (rst || (init_state_r == INIT_OCLKDELAY_READ))
	  oclk_calib_resume_level <= #TCQ 1'b0;
	else if (oclk_calib_resume)
	  oclk_calib_resume_level <= #TCQ 1'b1;
  end