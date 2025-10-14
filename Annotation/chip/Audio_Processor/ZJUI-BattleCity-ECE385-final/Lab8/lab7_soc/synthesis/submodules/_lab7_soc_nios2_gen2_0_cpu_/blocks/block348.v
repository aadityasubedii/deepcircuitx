  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_xbrk_trigout <= 0;
      else if (E_cpu_addr_en)
          E_xbrk_trigout <= xbrk_tout_hit;
    end