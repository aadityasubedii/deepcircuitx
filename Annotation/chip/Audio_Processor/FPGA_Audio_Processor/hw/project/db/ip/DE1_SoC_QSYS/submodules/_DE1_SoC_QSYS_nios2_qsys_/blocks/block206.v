  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_valid <= 0;
      else 
        E_valid <= R_valid | E_stall;
    end