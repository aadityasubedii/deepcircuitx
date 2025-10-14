  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          x1 <= 0;
      else 
        x1 <= ~x1;
    end