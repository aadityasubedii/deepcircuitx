  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_cmp_result <= 0;
      else 
        W_cmp_result <= E_cmp_result;
    end