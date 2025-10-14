  always @(posedge clk)
    if ((init_state_r == INIT_IDLE)||
        ((init_state_r == INIT_REFRESH)
          && (~mem_init_done_r))) begin
      cnt_init_mr_r      <= #TCQ 'b0;
      cnt_init_mr_done_r <= #TCQ 1'b0;
    end else if (init_state_r == INIT_LOAD_MR) begin
      cnt_init_mr_r      <= #TCQ cnt_init_mr_r + 1;
      cnt_init_mr_done_r <= #TCQ (cnt_init_mr_r == INIT_CNT_MR_DONE);
    end