  always @ (posedge clk) begin
      complex_byte_rd_done_r1 <= #TCQ complex_byte_rd_done;
      complex_ocal_num_samples_inc <= #TCQ (complex_byte_rd_done & ~complex_byte_rd_done_r1);
  end