  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          fifo_rdptr <= 0;
          fifo_wrptr <= 0;
          fifo_cnt <= 0;
          overflow_pending <= 1;
        end
      else 
        begin
          fifo_wrptr <= fifo_wrptr + fifo_wrptr_inc;
          fifo_cnt <= fifo_cnt + fifo_cnt_inc;
          if (~empty)
              fifo_rdptr <= fifo_rdptr + 1;
          if (~trc_this || (~ge2_free & input_ge2) || (~ge3_free & input_ge3))
              overflow_pending <= 1;
          else if (atm_valid | dtm_valid)
              overflow_pending <= 0;
        end
    end