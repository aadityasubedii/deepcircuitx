  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          force_reload <= 0;
      else if (clk_en)
          force_reload <= period_h_wr_strobe || period_l_wr_strobe;
    end