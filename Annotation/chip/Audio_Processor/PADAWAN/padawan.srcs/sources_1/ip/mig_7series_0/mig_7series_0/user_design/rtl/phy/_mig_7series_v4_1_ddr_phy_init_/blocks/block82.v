  always @(posedge clk)
    if (rst)
      complex_num_reads_dec <= #TCQ 'd1;
    else if (((init_state_r == INIT_RDLVL_COMPLEX_READ_WAIT) && (complex_wait_cnt == 'd15) && ~complex_row0_rd_done) ||
              ((init_state_r == INIT_RDLVL_STG1_WRITE_READ) || (init_state_r == INIT_RDLVL_COMPLEX_ACT_WAIT)))
      complex_num_reads_dec <= #TCQ complex_num_reads;
    else if ((init_state_r == INIT_RDLVL_COMPLEX_READ) && (complex_num_reads_dec > 'd0))
      complex_num_reads_dec <= #TCQ complex_num_reads_dec - 1;
