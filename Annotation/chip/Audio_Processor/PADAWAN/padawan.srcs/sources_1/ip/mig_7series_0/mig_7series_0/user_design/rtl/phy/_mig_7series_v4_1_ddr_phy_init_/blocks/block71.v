  always @(posedge clk)
    if (rst)
      complex_ocal_odt_ext <= #TCQ 1'b0;
    else if (((init_state_r == INIT_PRECHARGE_PREWAIT) && cnt_cmd_done_m7_r) || (init_state_r == INIT_OCLKDELAY_READ_WAIT))
      complex_ocal_odt_ext <= #TCQ 1'b0;
    else if ((init_state_r == INIT_OCAL_CENTER_WRITE) || (init_state_r == INIT_OCAL_CENTER_WRITE_WAIT))
      complex_ocal_odt_ext <= #TCQ 1'b1;
