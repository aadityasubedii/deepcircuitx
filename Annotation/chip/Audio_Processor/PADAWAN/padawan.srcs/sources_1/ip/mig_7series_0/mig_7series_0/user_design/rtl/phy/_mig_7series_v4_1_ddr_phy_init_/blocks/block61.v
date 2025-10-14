  always @(posedge clk) begin
    if (rst || wrcal_done)
      extend_cal_pat <= #TCQ 1'b0;
    else if (temp_lmr_done && (PRE_REV3ES == "ON")) 
      extend_cal_pat <= #TCQ 1'b1;
  end