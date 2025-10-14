  always @(posedge clk)
    begin
      if (fifo_wr)
          $write("%c", fifo_wdata);
    end
