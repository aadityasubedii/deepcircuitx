  always @ (posedge clk) begin
    complex_ocal_reset_rd_addr <= #TCQ ((init_state_r == INIT_OCAL_COMPLEX_ACT_WAIT) && (complex_wait_cnt == 'd9)) || (prbs_last_byte_done && ~prbs_last_byte_done_r);
    
  end