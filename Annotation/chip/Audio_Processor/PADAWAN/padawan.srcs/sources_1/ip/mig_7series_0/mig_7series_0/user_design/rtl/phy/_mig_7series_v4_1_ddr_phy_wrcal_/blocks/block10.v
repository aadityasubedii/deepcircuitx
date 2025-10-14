        always @(posedge clk) begin
          pat1_match_rise0_and_r <= #TCQ &pat1_match_rise0_r;
          pat1_match_fall0_and_r <= #TCQ &pat1_match_fall0_r;
          pat1_match_rise1_and_r <= #TCQ &pat1_match_rise1_r;
          pat1_match_fall1_and_r <= #TCQ &pat1_match_fall1_r;
          pat1_data_match_r <= #TCQ (pat1_match_rise0_and_r &&
                                    pat1_match_fall0_and_r &&
                                    pat1_match_rise1_and_r &&
                                    pat1_match_fall1_and_r);
          pat1_data_match_r1     <= #TCQ pat1_data_match_r;

          pat2_match_rise0_and_r <= #TCQ &pat2_match_rise0_r && rd_active_r3;
          pat2_match_fall0_and_r <= #TCQ &pat2_match_fall0_r && rd_active_r3;
          pat2_match_rise1_and_r <= #TCQ &pat2_match_rise1_r && rd_active_r3;
          pat2_match_fall1_and_r <= #TCQ &pat2_match_fall1_r && rd_active_r3;
          pat2_data_match_r <= #TCQ (pat2_match_rise0_and_r &&
                                    pat2_match_fall0_and_r &&
                                    pat2_match_rise1_and_r &&
                                    pat2_match_fall1_and_r);

          
          
          
          
          pat_data_match_valid_r <= #TCQ rd_active_r4 & ~rd_active_r5;
        end