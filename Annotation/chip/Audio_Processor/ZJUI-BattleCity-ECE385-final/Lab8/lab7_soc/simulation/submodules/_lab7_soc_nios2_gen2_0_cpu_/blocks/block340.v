  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_13 <= 0;
      else if (fifo_13_enable)
          fifo_13 <= fifo_13_mux;
    end