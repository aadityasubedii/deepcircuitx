  always @(posedge clk)
    if (rst || wrcal_done)
      burst_addr_r <= #TCQ 1'b0;
    else if ((init_state_r == INIT_WRCAL_ACT_WAIT) ||
             (init_state_r == INIT_OCLKDELAY_ACT_WAIT) ||
             (init_state_r == INIT_OCLKDELAY_WRITE) ||   
             (init_state_r == INIT_OCLKDELAY_READ) ||
             (init_state_r == INIT_WRCAL_WRITE) ||
             (init_state_r == INIT_WRCAL_WRITE_READ) ||
             (init_state_r == INIT_WRCAL_READ) ||
             (init_state_r == INIT_WRCAL_MULT_READS) ||
             (init_state_r == INIT_WRCAL_READ_WAIT))
      burst_addr_r <= #TCQ 1'b1;
    else if (rdlvl_wr_rd && new_burst_r)
      burst_addr_r <= #TCQ ~burst_addr_r;
    else
      burst_addr_r <= #TCQ 1'b0;
