      always @(posedge clk) begin
        pat0_match_rise0_and_r <= #TCQ &pat0_match_rise0_r;
        pat0_match_fall0_and_r <= #TCQ &pat0_match_fall0_r;
        pat0_match_rise1_and_r <= #TCQ &pat0_match_rise1_r;
        pat0_match_fall1_and_r <= #TCQ &pat0_match_fall1_r;
        pat0_match_rise2_and_r <= #TCQ &pat0_match_rise2_r;
        pat0_match_fall2_and_r <= #TCQ &pat0_match_fall2_r;
        pat0_match_rise3_and_r <= #TCQ &pat0_match_rise3_r;
        pat0_match_fall3_and_r <= #TCQ &pat0_match_fall3_r;
        pat0_data_match_r <= #TCQ (pat0_match_rise0_and_r &&
                                   pat0_match_fall0_and_r &&
                                   pat0_match_rise1_and_r &&
                                   pat0_match_fall1_and_r &&
                                   pat0_match_rise2_and_r &&
                                   pat0_match_fall2_and_r &&
                                   pat0_match_rise3_and_r &&
                                   pat0_match_fall3_and_r);
      end