  always @ (posedge clk)
    if (rst) 
      complex_oclkdelay_calib_start_int <= #TCQ 'b0;
    else if ((init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE_PREWAIT) && prbs_last_byte_done_r) 
      complex_oclkdelay_calib_start_int <= #TCQ 'b1;
	  