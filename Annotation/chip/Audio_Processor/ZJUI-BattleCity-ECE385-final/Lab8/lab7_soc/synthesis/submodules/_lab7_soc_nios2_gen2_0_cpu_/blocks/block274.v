  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_11 <= 0;
      else if (fifo_11_enable)
          fifo_11 <= fifo_11_mux;
    end