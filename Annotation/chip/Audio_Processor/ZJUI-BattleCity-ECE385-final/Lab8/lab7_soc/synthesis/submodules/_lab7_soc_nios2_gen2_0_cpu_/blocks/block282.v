  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_8 <= 0;
      else if (fifo_8_enable)
          fifo_8 <= fifo_8_mux;
    end