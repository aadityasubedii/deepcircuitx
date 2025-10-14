      always @(posedge clk) grant_col_wr_r <= #TCQ grant_col_wr_ns;
      assign grant_col_wr = grant_col_wr_ns;
    end 