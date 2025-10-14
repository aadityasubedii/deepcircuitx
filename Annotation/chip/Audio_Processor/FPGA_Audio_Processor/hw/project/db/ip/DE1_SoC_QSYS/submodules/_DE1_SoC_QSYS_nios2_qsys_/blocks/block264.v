  always @(posedge clkx2 or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          x2 <= 0;
          tr_clk_reg <= 0;
          tr_data_reg <= 0;
        end
      else 
        begin
          x2 <= x1;
          tr_clk_reg <= ~phase;
          tr_data_reg <= phase ?   tw[17 : 0] :   tw[35 : 18];
        end
    end