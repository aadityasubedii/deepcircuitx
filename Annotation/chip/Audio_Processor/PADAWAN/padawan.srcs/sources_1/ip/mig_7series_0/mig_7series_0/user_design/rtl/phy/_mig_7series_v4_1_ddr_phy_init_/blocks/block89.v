  always @ (posedge clk) begin
    if (rst || (init_state_r == INIT_RDLVL_STG1_WRITE)  || prbs_rdlvl_done_pulse)
      complex_byte_rd_done <= #TCQ 'b0;
    else if (prbs_rdlvl_done && (complex_row1_rd_cnt == (COMPLEX_RD-1)) && (complex_row1_rd_done & ~complex_row1_rd_done_r1))
      complex_byte_rd_done <= #TCQ 'b1;
  end