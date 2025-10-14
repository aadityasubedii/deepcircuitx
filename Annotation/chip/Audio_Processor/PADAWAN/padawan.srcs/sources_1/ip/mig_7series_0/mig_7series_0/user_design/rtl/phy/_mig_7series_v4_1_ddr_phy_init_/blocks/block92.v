  always @(posedge clk)
    if (rst || prbs_rdlvl_done_pulse)
      complex_row1_rd_done    <= #TCQ 1'b0;
    else if ((init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE) || (init_state_r == INIT_PRECHARGE))
      complex_row1_rd_done    <= #TCQ 1'b0;
    else if (complex_row0_rd_done && (stg1_wr_rd_cnt == 9'd2))
      complex_row1_rd_done    <= #TCQ 1'b1;
      