  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          writedata <= 0;
      else 
        writedata <= writedata_nxt;
    end