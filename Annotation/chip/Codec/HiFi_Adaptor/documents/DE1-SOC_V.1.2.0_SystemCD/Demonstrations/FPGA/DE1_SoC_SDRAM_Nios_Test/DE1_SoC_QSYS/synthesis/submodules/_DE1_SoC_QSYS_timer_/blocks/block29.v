  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          internal_counter <= 32'h22E97;
      else if (counter_is_running || force_reload)
          if (counter_is_zero    || force_reload)
              internal_counter <= counter_load_value;
          else 
            internal_counter <= internal_counter - 1;
    end