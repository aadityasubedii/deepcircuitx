        always @(posedge clk) begin
         early1_match_rise0_and_r <= #TCQ &early1_match_rise0_r;
         early1_match_fall0_and_r <= #TCQ &early1_match_fall0_r;
         early1_match_rise1_and_r <= #TCQ &early1_match_rise1_r;
         early1_match_fall1_and_r <= #TCQ &early1_match_fall1_r;
         early1_data_match_r <= #TCQ (early1_match_rise0_and_r &&
                                      early1_match_fall0_and_r &&
                                      early1_match_rise1_and_r &&
                                      early1_match_fall1_and_r);
         early1_data_match_r1 <= #TCQ early1_data_match_r;

         early2_match_rise0_and_r <= #TCQ &early2_match_rise0_r && rd_active_r3;
         early2_match_fall0_and_r <= #TCQ &early2_match_fall0_r && rd_active_r3;
         early2_match_rise1_and_r <= #TCQ &early2_match_rise1_r && rd_active_r3;
         early2_match_fall1_and_r <= #TCQ &early2_match_fall1_r && rd_active_r3;
         early2_data_match_r <= #TCQ (early2_match_rise0_and_r &&
                                      early2_match_fall0_and_r &&
                                      early2_match_rise1_and_r &&
                                      early2_match_fall1_and_r);
       end