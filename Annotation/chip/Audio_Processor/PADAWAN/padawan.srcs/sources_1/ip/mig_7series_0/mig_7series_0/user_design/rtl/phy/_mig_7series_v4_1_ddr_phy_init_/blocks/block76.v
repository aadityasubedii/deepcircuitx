  always @(posedge clk)
    if (rst || prbs_rdlvl_done_pulse)
      complex_num_writes_dec <= #TCQ 'd1;
    else if (((init_state_r == INIT_OCAL_COMPLEX_WRITE_WAIT) && (complex_wait_cnt == 'd15) && ~complex_row0_rd_done) ||
              ((init_state_r == INIT_RDLVL_STG1_WRITE_READ) || (init_state_r == INIT_RDLVL_COMPLEX_ACT_WAIT)))
      complex_num_writes_dec <= #TCQ complex_num_writes;
    else if ((init_state_r == INIT_RDLVL_STG1_WRITE) && (complex_num_writes_dec > 'd0))
      complex_num_writes_dec <= #TCQ complex_num_writes_dec - 1;
