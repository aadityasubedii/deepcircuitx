  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_alu_result <= 0;
      else 
        W_alu_result <= E_alu_result;
    end