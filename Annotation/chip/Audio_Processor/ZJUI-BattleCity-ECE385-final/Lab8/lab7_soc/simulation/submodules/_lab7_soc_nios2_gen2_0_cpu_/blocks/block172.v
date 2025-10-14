  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_status_reg_pie <= 0;
      else 
        W_status_reg_pie <= W_status_reg_pie_nxt;
    end