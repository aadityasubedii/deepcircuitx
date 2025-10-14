      always @(posedge clk) begin
        idel_pat0_match_rise0_and_r <= #TCQ &idel_pat0_match_rise0_r;
        idel_pat0_match_fall0_and_r <= #TCQ &idel_pat0_match_fall0_r;
        idel_pat0_match_rise1_and_r <= #TCQ &idel_pat0_match_rise1_r;
        idel_pat0_match_fall1_and_r <= #TCQ &idel_pat0_match_fall1_r;
        idel_pat0_match_rise2_and_r <= #TCQ &idel_pat0_match_rise2_r;
        idel_pat0_match_fall2_and_r <= #TCQ &idel_pat0_match_fall2_r;
        idel_pat0_match_rise3_and_r <= #TCQ &idel_pat0_match_rise3_r;
        idel_pat0_match_fall3_and_r <= #TCQ &idel_pat0_match_fall3_r;
        idel_pat0_data_match_r <= #TCQ (idel_pat0_match_rise0_and_r &&
                                        idel_pat0_match_fall0_and_r &&
                                        idel_pat0_match_rise1_and_r &&
                                        idel_pat0_match_fall1_and_r &&
                                        idel_pat0_match_rise2_and_r &&
                                        idel_pat0_match_fall2_and_r &&
                                        idel_pat0_match_rise3_and_r &&
                                        idel_pat0_match_fall3_and_r);
      end