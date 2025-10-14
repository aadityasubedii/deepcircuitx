  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_12 <= 0;
      else if (fifo_12_enable)
          fifo_12 <= fifo_12_mux;
    end