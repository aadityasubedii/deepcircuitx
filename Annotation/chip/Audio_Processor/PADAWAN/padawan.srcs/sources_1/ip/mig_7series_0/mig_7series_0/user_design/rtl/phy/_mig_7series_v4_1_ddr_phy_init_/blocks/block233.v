  always @(posedge clk)
    if (rst)
      calib_writes <= #TCQ 1'b0;
    else if ((init_state_r == INIT_OCLKDELAY_WRITE) || 
             (init_state_r == INIT_OCAL_CENTER_WRITE) || 
             (init_state_r == INIT_RDLVL_STG1_WRITE) ||
             (init_state_r == INIT_RDLVL_STG1_WRITE_READ) ||
             (init_state_r == INIT_WRCAL_WRITE) ||
             (init_state_r == INIT_WRCAL_WRITE_READ))
      calib_writes <= #TCQ 1'b1;
    else
      calib_writes <= #TCQ 1'b0;