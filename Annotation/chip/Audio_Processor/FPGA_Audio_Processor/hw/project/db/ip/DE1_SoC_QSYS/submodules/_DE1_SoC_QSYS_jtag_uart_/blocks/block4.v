  always @(posedge clk or negedge rst_n)
    begin
      if (rst_n == 0)
          readyfordata <= 0;
      else 
        readyfordata <= ~fifo_FF;
    end