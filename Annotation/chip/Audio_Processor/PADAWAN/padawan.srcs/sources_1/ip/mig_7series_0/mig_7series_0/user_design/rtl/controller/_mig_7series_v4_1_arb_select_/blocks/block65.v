    always @(posedge clk) 
    begin
      if (rst)
         cke_r = 1'b1;
      else
         cke_r = cke_ns;
    end