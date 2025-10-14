  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_5 <= 0;
      else if (fifo_5_enable)
          fifo_5 <= fifo_5_mux;
    end