  always @(posedge clk)
    if (!cal1_wait_cnt_en_r) begin
      cal1_wait_cnt_r <= #TCQ 5'b00000;
      cal1_wait_r     <= #TCQ 1'b1;
    end else begin
      if (cal1_wait_cnt_r != PIPE_WAIT_CNT - 1) begin
        cal1_wait_cnt_r <= #TCQ cal1_wait_cnt_r + 1;
        cal1_wait_r     <= #TCQ 1'b1;
      end else begin
        
        
        cal1_wait_cnt_r <= #TCQ 5'b00000;
        cal1_wait_r     <= #TCQ 1'b0;
      end
    end