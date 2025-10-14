  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          F_pc <= 67108864;
      else if (F_pc_en)
          F_pc <= F_pc_nxt;
    end