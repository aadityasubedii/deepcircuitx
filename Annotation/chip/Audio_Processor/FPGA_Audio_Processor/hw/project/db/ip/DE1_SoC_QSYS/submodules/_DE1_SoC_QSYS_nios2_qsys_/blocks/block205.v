  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_new_inst <= 0;
      else 
        E_new_inst <= R_valid;
    end