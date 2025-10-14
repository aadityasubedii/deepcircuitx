  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_9 <= 0;
      else if (fifo_9_enable)
          fifo_9 <= fifo_9_mux;
    end