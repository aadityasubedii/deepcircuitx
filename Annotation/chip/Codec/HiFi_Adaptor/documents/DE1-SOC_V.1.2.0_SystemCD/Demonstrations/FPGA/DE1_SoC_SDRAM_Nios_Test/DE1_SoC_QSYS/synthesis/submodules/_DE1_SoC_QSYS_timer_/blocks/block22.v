  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          delayed_unxcounter_is_zeroxx0 <= 0;
      else if (clk_en)
          delayed_unxcounter_is_zeroxx0 <= counter_is_zero;
    end