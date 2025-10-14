  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          refresh_counter <= 10000;
      else if (refresh_counter == 0)
          refresh_counter <= 390;
      else 
        refresh_counter <= refresh_counter - 1'b1;
    end