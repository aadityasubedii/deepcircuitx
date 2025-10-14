       always @(posedge clk) begin
         early2_match_rise0_and_r <= #TCQ &early2_match_rise0_r;
         early2_match_fall0_and_r <= #TCQ &early2_match_fall0_r;
         early2_match_rise1_and_r <= #TCQ &early2_match_rise1_r;
         early2_match_fall1_and_r <= #TCQ &early2_match_fall1_r;
         early2_match_rise2_and_r <= #TCQ &early2_match_rise2_r;
         early2_match_fall2_and_r <= #TCQ &early2_match_fall2_r;
         early2_match_rise3_and_r <= #TCQ &early2_match_rise3_r;
         early2_match_fall3_and_r <= #TCQ &early2_match_fall3_r;
         early2_data_match_r <= #TCQ (early2_match_rise0_and_r &&
                                   early2_match_fall0_and_r &&
                                   early2_match_rise1_and_r &&
                                   early2_match_fall1_and_r &&
                                   early2_match_rise2_and_r &&
                                   early2_match_fall2_and_r &&
                                   early2_match_rise3_and_r &&
                                   early2_match_fall3_and_r);
       end