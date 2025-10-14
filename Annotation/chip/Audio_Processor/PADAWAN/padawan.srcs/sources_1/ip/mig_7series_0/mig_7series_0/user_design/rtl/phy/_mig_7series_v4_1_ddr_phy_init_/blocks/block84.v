  always @(posedge clk)
    if (rst)
      complex_wait_cnt <= #TCQ 'd0;
    else if (((init_state_r == INIT_RDLVL_COMPLEX_READ_WAIT) ||
              (init_state_r == INIT_OCAL_COMPLEX_WRITE_WAIT) ||
              (init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE_PREWAIT) ||
              (init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE_WAIT) ||
              (init_state_r == INIT_OCAL_COMPLEX_ACT_WAIT) ||
              (init_state_r == INIT_RDLVL_COMPLEX_ACT_WAIT)) && complex_wait_cnt < 'd15)
      complex_wait_cnt <= #TCQ complex_wait_cnt + 1;
    else
      complex_wait_cnt <= #TCQ 'd0;