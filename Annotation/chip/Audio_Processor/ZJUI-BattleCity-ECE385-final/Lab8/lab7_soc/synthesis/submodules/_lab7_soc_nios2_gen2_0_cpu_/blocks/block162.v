  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_writedata <= 0;
      else 
        d_writedata <= E_st_data;
    end