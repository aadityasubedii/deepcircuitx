  always @(posedge clk)
    if (!cnt_pwron_cke_done_r) begin
      cnt_init_pre_wait_r      <= #TCQ 'b0;
      cnt_init_pre_wait_done_r <= #TCQ 1'b0;
    end else begin
      cnt_init_pre_wait_r <= #TCQ cnt_init_pre_wait_r + 1;
      if (!cnt_init_pre_wait_done_r)
        cnt_init_pre_wait_done_r 
          <= #TCQ (cnt_init_pre_wait_r >= DDR2_INIT_PRE_CNT);
    end