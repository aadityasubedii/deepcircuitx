  always @(posedge clk)
    if (rst ||
       ((init_state_r1 != INIT_WRLVL_START) && 
       (init_state_r == INIT_WRLVL_START)))
      wrlvl_odt_ctl <= #TCQ 1'b0;
    else if (wrlvl_rank_done && ~wrlvl_rank_done_r1)
      wrlvl_odt_ctl <= #TCQ 1'b1;
