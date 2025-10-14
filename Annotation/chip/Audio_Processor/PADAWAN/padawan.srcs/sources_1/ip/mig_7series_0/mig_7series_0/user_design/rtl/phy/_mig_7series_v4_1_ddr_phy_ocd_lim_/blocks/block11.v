  always @(posedge clk) begin
    if (!wait_cnt_en_r) begin
      wait_cnt_r      <= #TCQ 'b0;
      wait_cnt_done   <= #TCQ 1'b0;
    end else begin
      if (wait_cnt_r != WAIT_CNT - 1) begin
        wait_cnt_r     <= #TCQ wait_cnt_r + 1;
        wait_cnt_done  <= #TCQ 1'b0;
      end else begin
        wait_cnt_r     <= #TCQ 'b0;        
        wait_cnt_done  <= #TCQ 1'b1;
      end
    end
  end