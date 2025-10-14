  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          read <= 0;
      else 
        read <= read ? waitrequest : read_nxt;
    end