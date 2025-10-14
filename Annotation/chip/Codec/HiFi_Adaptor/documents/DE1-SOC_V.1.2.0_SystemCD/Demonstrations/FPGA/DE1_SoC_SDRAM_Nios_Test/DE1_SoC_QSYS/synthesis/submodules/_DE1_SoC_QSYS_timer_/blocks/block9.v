  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          counter_snapshot <= 0;
      else if (snap_strobe)
          counter_snapshot <= internal_counter;
    end