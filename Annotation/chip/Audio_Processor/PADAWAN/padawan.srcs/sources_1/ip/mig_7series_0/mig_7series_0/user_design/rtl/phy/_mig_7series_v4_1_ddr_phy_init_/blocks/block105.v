    always @(posedge clk)
      if (rst || ~rdlvl_stg1_done_r1 || prbs_rdlvl_done)
        complex_row_cnt <= #TCQ 'd0;
      else if ((stg1_wr_rd_cnt == 'd22) && (((init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE_WAIT) && (complex_wait_cnt == 'd15)) || complex_rdlvl_int_ref_req))
        complex_row_cnt <= #TCQ 'd1;
      else
        complex_row_cnt <= #TCQ 'd0;
  end