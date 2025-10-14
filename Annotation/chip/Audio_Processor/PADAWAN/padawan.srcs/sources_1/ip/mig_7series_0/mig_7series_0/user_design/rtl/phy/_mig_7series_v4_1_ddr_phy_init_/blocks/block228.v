  always @ (posedge clk) begin
    if (rst)
      complex_ocal_wr_start <= #TCQ 'b0;
    else
      complex_ocal_wr_start <= #TCQ complex_ocal_reset_rd_addr? 1'b1 : complex_ocal_wr_start;
  end