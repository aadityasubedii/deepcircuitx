  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          av_ld_byte3_data <= 0;
      else 
        av_ld_byte3_data <= av_ld_byte3_data_nxt;
    end