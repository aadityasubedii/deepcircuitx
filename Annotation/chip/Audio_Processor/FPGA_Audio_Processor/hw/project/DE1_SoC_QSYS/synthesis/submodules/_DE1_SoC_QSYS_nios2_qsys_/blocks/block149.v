  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          av_ld_align_cycle <= 0;
      else 
        av_ld_align_cycle <= av_ld_align_cycle_nxt;
    end