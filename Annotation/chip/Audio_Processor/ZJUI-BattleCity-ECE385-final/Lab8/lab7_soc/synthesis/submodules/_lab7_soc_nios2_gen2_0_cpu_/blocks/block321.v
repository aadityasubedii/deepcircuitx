  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          atm <= 0;
          dtm <= 0;
        end
      else 
        begin
          atm <= 0;
          dtm <= 0;
        end
    end