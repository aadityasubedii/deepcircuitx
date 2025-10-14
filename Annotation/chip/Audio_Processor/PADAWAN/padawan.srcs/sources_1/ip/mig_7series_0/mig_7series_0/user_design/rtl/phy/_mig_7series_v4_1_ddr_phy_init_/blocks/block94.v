  always @(posedge clk)
    if (rst || prbs_rdlvl_done_pulse)
      complex_row0_rd_done    <= #TCQ 1'b0;
    else if (complex_sample_cnt_inc)
      complex_row0_rd_done    <= #TCQ 1'b0;
    else if ( (prbs_rdlvl_start || complex_oclkdelay_calib_start_int) && (stg1_wr_rd_cnt == 9'd2) && complex_row0_wr_done && complex_row1_wr_done)
      complex_row0_rd_done    <= #TCQ 1'b1;
      