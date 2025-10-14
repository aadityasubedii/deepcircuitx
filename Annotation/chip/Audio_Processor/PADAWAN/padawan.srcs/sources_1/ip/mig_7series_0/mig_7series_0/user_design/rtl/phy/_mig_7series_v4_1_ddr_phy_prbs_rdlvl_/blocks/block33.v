  always @(posedge clk)
    if (!wait_state_cnt_en_r) begin
      wait_state_cnt_r <= #TCQ 'b0;
      cnt_wait_state   <= #TCQ 1'b0;
    end else begin
      if (wait_state_cnt_r < 'd15) begin
        wait_state_cnt_r <= #TCQ wait_state_cnt_r + 1;
        cnt_wait_state   <= #TCQ 1'b0;
      end else begin
        
        
        wait_state_cnt_r <= #TCQ 'b0;        
        cnt_wait_state   <= #TCQ 1'b1;
      end
    end