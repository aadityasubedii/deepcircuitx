  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_control_rd_data <= 0;
      else 
        W_control_rd_data <= D_ctrl_intr_inst ? W_status_reg : E_control_rd_data;
    end