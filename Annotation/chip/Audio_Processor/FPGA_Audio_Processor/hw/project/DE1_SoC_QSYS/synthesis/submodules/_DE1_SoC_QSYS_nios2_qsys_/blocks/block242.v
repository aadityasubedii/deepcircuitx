  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          write <= 0;
      else 
        write <= write ? waitrequest : write_nxt;
    end