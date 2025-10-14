  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          xbrk_break <= 0;
      else if (E_cpu_addr_en)
          xbrk_break <= xbrk_break_hit;
    end