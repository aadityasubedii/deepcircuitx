  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          debugaccess <= 0;
      else 
        debugaccess <= debugaccess_nxt;
    end