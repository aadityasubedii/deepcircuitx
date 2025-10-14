  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          av_ld_byte1_data <= 0;
      else if (av_ld_byte1_data_en)
          av_ld_byte1_data <= av_ld_byte1_data_nxt;
    end