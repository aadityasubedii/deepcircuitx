  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_estatus_reg <= 0;
      else 
        W_estatus_reg <= W_estatus_reg_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_bstatus_reg <= 0;
      else 
        W_bstatus_reg <= W_bstatus_reg_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ienable_reg <= 0;
      else 
        W_ienable_reg <= W_ienable_reg_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ipending_reg <= 0;
      else 
        W_ipending_reg <= W_ipending_reg_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_cdsr_reg <= 0;
      else 
        W_cdsr_reg <= 0;
    end


  assign W_cpuid_reg = 0;
  assign W_wr_data_non_zero = R_ctrl_br_cmp ? W_cmp_result :