  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_byteenable <= 0;
      else 
        d_byteenable <= E_mem_byte_en;
    end