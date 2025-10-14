  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          av_ld_waiting_for_data <= 0;
      else 
        av_ld_waiting_for_data <= av_ld_waiting_for_data_nxt;
    end