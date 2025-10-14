  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          refresh_request <= 0;
      else if (1)
          refresh_request <= ((refresh_counter == 0) | refresh_request) & ~ack_refresh_request & init_done;
    end