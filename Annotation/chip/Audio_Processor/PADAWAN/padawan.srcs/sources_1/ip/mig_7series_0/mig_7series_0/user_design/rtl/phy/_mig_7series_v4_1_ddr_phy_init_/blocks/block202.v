  always @(posedge clk)
    if (rst || 
        ((stg1_wr_rd_cnt == 'd2) && ~stg1_wr_done) || complex_oclkdelay_calib_done || 
          (complex_wait_cnt == 'd15 && complex_num_writes == 1 && complex_ocal_wr_start) ||
          ( init_state_r == INIT_RDLVL_STG1_WRITE && complex_num_writes_dec == 'd2) || ~complex_ocal_wr_start ||
          (complex_byte_rd_done && init_state_r == INIT_RDLVL_COMPLEX_ACT ) ||
	  (init_state_r != INIT_OCAL_COMPLEX_RESUME_WAIT && init_state_r1 == INIT_OCAL_COMPLEX_RESUME_WAIT) ||
          (init_state_r == INIT_OCAL_COMPLEX_ACT))                       
      prbs_gen_oclk_clk_en <= #TCQ 1'b0;
    else if ((~phy_if_empty_r && ~complex_oclkdelay_calib_done && prbs_rdlvl_done_r1) || 
             ((init_state_r == INIT_OCAL_COMPLEX_ACT_WAIT) && (complex_wait_cnt == 'd14)) ||
             ((init_state_r == INIT_OCAL_COMPLEX_WRITE_WAIT) && (complex_wait_cnt == 'd14)) ||
	     exit_ocal_complex_resume_wait ||
             ((init_state_r == INIT_RDLVL_COMPLEX_ACT_WAIT) && ~stg1_wr_done && ~complex_row1_wr_done && ~complex_ocal_num_samples_done_r && (complex_wait_cnt == 'd14)) 
             || (init_state_r == INIT_RDLVL_COMPLEX_READ) )
      prbs_gen_oclk_clk_en <= #TCQ 1'b1;
