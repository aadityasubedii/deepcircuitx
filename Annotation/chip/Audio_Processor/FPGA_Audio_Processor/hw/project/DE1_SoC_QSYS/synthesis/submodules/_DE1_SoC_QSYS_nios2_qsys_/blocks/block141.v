  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_control_rd_data <= 0;
      else 
        W_control_rd_data <= E_control_rd_data;
    end