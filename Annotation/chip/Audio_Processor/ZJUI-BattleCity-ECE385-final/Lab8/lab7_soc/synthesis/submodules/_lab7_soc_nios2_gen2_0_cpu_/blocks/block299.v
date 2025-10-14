  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_2 <= 0;
      else if (fifo_2_enable)
          fifo_2 <= fifo_2_mux;
    end