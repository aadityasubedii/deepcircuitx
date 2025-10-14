  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timeout_occurred <= 0;
      else if (clk_en)
          if (status_wr_strobe)
              timeout_occurred <= 0;
          else if (timeout_event)
              timeout_occurred <= -1;
    end