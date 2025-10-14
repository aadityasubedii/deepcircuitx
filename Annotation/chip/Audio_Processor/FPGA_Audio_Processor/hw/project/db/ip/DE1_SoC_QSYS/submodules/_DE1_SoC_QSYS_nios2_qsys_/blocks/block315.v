  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_1 <= 0;
      else if (fifo_1_enable)
          fifo_1 <= fifo_1_mux;
    end