  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_xbrk_traceoff <= 0;
      else if (E_cpu_addr_en)
          E_xbrk_traceoff <= xbrk_toff_hit;
    end