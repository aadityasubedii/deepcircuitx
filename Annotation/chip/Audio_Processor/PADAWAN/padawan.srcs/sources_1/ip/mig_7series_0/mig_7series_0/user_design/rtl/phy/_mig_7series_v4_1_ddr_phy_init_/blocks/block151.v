    always @(posedge clk)
      if ((init_state_r == INIT_IDLE) || rdlvl_last_byte_done || 
          (complex_byte_rd_done) || prbs_rdlvl_done_pulse )
        stg1_wr_done <= #TCQ 1'b0;
      else if (init_state_r == INIT_RDLVL_STG1_WRITE_READ)
        stg1_wr_done <= #TCQ 1'b1;
  end else begin: two_ranks