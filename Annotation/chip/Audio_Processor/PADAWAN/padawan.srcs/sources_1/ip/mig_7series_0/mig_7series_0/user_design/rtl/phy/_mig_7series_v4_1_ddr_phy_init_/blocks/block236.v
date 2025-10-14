  always @(posedge clk) begin
    if (rst)
      wrcal_final_chk <= #TCQ 1'b0;
    else if ((init_next_state == INIT_WRCAL_ACT) && (wrcal_done || (SKIP_CALIB == "TRUE")) && 
             (DRAM_TYPE == "DDR3"))
      wrcal_final_chk <= #TCQ 1'b1;
  end