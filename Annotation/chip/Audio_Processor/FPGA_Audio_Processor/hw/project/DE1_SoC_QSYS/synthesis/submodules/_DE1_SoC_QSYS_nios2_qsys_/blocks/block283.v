  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_10 <= 0;
      else if (fifo_10_enable)
          fifo_10 <= fifo_10_mux;
    end