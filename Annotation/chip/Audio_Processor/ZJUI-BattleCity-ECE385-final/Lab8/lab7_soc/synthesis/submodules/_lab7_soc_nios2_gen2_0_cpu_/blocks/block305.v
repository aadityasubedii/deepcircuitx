  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_0 <= 0;
      else if (fifo_0_enable)
          fifo_0 <= fifo_0_mux;
    end