      always @(posedge clk) begin
        idel_pat1_match_rise0_and_r <= #TCQ &idel_pat1_match_rise0_r;
        idel_pat1_match_fall0_and_r <= #TCQ &idel_pat1_match_fall0_r;
        idel_pat1_match_rise1_and_r <= #TCQ &idel_pat1_match_rise1_r;
        idel_pat1_match_fall1_and_r <= #TCQ &idel_pat1_match_fall1_r;
        idel_pat1_data_match_r <= #TCQ (idel_pat1_match_rise0_and_r &&
                                        idel_pat1_match_fall0_and_r &&
                                        idel_pat1_match_rise1_and_r &&
                                        idel_pat1_match_fall1_and_r);
      end