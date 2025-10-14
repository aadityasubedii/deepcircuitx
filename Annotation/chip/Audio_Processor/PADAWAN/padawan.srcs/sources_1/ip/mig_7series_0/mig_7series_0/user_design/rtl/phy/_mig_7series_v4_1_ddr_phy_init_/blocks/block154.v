  always @(posedge clk)
    if (init_state_r == INIT_IDLE) begin
      cnt_init_af_r      <= #TCQ 'b0;
      cnt_init_af_done_r <= #TCQ 1'b0;
    end else if ((init_state_r == INIT_REFRESH) && (~mem_init_done_r))begin
      cnt_init_af_r      <= #TCQ cnt_init_af_r + 1;
      cnt_init_af_done_r <= #TCQ (cnt_init_af_r == 2'b11);
    end   