  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_7 <= 0;
      else if (fifo_7_enable)
          fifo_7 <= fifo_7_mux;
    end