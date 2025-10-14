  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_xbrk_goto0 <= 0;
      else if (E_cpu_addr_en)
          E_xbrk_goto0 <= xbrk_goto0_hit;
    end