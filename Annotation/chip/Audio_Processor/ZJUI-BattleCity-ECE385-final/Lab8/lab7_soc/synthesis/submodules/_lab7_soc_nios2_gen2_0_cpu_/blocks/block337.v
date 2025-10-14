  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbrk_break <= 0;
      else 
        dbrk_break <= dbrk_break   ? ~debugack   
                : dbrk_break_pulse;

    end