  always @ (posedge clk)
    if (rst) 
      complex_oclkdelay_calib_start <= #TCQ 'b0;
    else if (complex_oclkdelay_calib_start_int && (init_state_r == INIT_OCAL_CENTER_WRITE_WAIT) && prbs_rdlvl_done) 
      complex_oclkdelay_calib_start <= #TCQ 'b1;
        