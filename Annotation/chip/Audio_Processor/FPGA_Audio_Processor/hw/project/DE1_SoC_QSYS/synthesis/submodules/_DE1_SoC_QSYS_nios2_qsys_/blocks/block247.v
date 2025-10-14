  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          address <= 0;
      else 
        address <= address_nxt;
    end