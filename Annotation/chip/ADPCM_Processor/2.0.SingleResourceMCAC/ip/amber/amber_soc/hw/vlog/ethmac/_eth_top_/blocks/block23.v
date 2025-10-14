  always @ (posedge wb_clk_i or posedge wb_rst_i)
  begin
    if(wb_rst_i)
      begin
        temp_wb_ack_o_reg <=#Tp 1'b0;
        temp_wb_dat_o_reg <=#Tp 32'h0;
        temp_wb_err_o_reg <=#Tp 1'b0;
      end
    else
      begin
        temp_wb_ack_o_reg <=#Tp temp_wb_ack_o & ~temp_wb_ack_o_reg;
        temp_wb_dat_o_reg <=#Tp temp_wb_dat_o;
        temp_wb_err_o_reg <=#Tp temp_wb_err_o & ~temp_wb_err_o_reg;
      end
  end