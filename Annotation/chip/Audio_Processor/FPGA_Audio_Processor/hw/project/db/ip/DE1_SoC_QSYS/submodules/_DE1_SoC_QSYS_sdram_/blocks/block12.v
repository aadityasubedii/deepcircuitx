  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          za_cannotrefresh <= 0;
      else if (1)
          za_cannotrefresh <= (refresh_counter == 0) & refresh_request;
    end