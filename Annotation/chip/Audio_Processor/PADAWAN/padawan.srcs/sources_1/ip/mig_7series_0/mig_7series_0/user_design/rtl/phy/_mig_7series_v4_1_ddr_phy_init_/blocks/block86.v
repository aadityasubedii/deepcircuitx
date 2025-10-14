    always @(posedge clk)
      if ((init_state_r == INIT_IDLE) || rdlvl_last_byte_done || ( complex_oclkdelay_calib_done && (init_state_r == INIT_RDLVL_STG1_WRITE )) || 
         (complex_byte_rd_done && init_state_r == INIT_RDLVL_COMPLEX_ACT) || prbs_rdlvl_done_pulse )
        complex_wr_done <= #TCQ 1'b0;
      else if ((init_state_r == INIT_RDLVL_COMPLEX_ACT_WAIT) && complex_row1_wr_done && (complex_wait_cnt == 'd13))
        complex_wr_done <= #TCQ 1'b1;
      else if ((init_state_r == INIT_OCAL_COMPLEX_ACT_WAIT) && complex_row1_wr_done && (complex_wait_cnt == 'd13))
        complex_wr_done <= #TCQ 1'b1;
  end else begin: dual_rank_complex