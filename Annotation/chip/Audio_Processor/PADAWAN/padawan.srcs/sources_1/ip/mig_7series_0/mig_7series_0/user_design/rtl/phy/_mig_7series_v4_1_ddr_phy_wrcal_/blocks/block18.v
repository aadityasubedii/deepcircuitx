       always @(posedge clk) begin
         pat_match_rise0_and_r <= #TCQ &pat_match_rise0_r;
         pat_match_fall0_and_r <= #TCQ &pat_match_fall0_r;
         pat_match_rise1_and_r <= #TCQ &pat_match_rise1_r;
         pat_match_fall1_and_r <= #TCQ &pat_match_fall1_r;
         pat_match_rise2_and_r <= #TCQ &pat_match_rise2_r;
         pat_match_fall2_and_r <= #TCQ &pat_match_fall2_r;
         pat_match_rise3_and_r <= #TCQ &pat_match_rise3_r;
         pat_match_fall3_and_r <= #TCQ &pat_match_fall3_r;
         pat_data_match_r <= #TCQ (pat_match_rise0_and_r &&
                                   pat_match_fall0_and_r &&
                                   pat_match_rise1_and_r &&
                                   pat_match_fall1_and_r &&
                                   pat_match_rise2_and_r &&
                                   pat_match_fall2_and_r &&
                                   pat_match_rise3_and_r &&
                                   pat_match_fall3_and_r);
         pat_data_match_valid_r <= #TCQ rd_active_r3;
       end