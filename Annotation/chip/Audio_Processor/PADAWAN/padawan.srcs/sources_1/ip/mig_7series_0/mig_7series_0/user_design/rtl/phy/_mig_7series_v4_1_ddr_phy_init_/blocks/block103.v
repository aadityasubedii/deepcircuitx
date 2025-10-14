  always @(posedge clk)
    if (rst)
      complex_odt_ext <= #TCQ 1'b0;
    else if ((init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE) || (init_state_r == INIT_PRECHARGE))
      complex_odt_ext <= #TCQ 1'b0;
    else if (rdlvl_stg1_done_r1 && (stg1_wr_rd_cnt == 9'd1) && (init_state_r == INIT_RDLVL_STG1_WRITE))
      complex_odt_ext <= #TCQ 1'b1;
  