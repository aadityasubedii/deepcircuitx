  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_3 <= 0;
      else if (fifo_3_enable)
          fifo_3 <= fifo_3_mux;
    end