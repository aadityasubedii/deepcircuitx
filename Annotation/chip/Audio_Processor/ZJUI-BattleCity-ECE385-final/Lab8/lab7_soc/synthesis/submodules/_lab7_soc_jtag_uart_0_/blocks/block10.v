  always @(posedge clk or negedge rst_n)
    begin
      if (rst_n == 0)
          pause_irq <= 1'b0;
      else 
      if (t_pause & ~fifo_EF)
          pause_irq <= 1'b1;
      else if (read_0)
          pause_irq <= 1'b0;
    end