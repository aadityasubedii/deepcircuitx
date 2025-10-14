  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          byteenable <= 0;
      else 
        byteenable <= byteenable_nxt;
    end