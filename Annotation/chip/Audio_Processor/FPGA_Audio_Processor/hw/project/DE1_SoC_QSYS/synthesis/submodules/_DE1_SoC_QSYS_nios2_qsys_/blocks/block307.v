  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_4 <= 0;
      else if (fifo_4_enable)
          fifo_4 <= fifo_4_mux;
    end