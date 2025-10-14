  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          counter_is_running <= 1'b0;
      else if (clk_en)
          if (do_start_counter)
              counter_is_running <= -1;
          else if (do_stop_counter)
              counter_is_running <= 0;
    end