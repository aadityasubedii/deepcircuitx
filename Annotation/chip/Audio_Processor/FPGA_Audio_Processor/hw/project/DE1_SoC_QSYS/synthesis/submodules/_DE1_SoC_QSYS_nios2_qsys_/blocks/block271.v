  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_14 <= 0;
      else if (fifo_14_enable)
          fifo_14 <= fifo_14_mux;
    end