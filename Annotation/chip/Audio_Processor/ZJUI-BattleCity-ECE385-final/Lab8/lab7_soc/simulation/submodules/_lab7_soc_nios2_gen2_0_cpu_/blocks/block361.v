  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_6 <= 0;
      else if (fifo_6_enable)
          fifo_6 <= fifo_6_mux;
    end