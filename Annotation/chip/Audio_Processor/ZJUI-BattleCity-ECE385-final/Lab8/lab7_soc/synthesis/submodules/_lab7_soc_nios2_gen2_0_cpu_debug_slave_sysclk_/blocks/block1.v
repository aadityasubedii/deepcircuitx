  always @(posedge clk)
    begin
      if (jxuir)
          ir <= ir_in;
      if (update_jdo_strobe)
          jdo <= sr;
    end