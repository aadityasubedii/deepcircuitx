        always @(posedge clk) begin
          if (sr_rise0_r[pt_i] == pat_rise2[pt_i%4])
            early2_match_rise0_r[pt_i] <= #TCQ 1'b1;
          else
            early2_match_rise0_r[pt_i] <= #TCQ 1'b0;

          if (sr_fall0_r[pt_i] == pat_fall2[pt_i%4])
            early2_match_fall0_r[pt_i] <= #TCQ 1'b1;
          else
            early2_match_fall0_r[pt_i] <= #TCQ 1'b0;

          if (sr_rise1_r[pt_i] == pat_rise3[pt_i%4])
            early2_match_rise1_r[pt_i] <= #TCQ 1'b1;
          else
            early2_match_rise1_r[pt_i] <= #TCQ 1'b0;

          if (sr_fall1_r[pt_i] == pat_fall3[pt_i%4])
            early2_match_fall1_r[pt_i] <= #TCQ 1'b1;
          else
            early2_match_fall1_r[pt_i] <= #TCQ 1'b0;

          if (sr_rise2_r[pt_i] == early_rise0[pt_i%4])
            early2_match_rise2_r[pt_i] <= #TCQ 1'b1;
          else
            early2_match_rise2_r[pt_i] <= #TCQ 1'b0;

          if (sr_fall2_r[pt_i] == early_fall0[pt_i%4])
            early2_match_fall2_r[pt_i] <= #TCQ 1'b1;
          else
            early2_match_fall2_r[pt_i] <= #TCQ 1'b0;

          if (sr_rise3_r[pt_i] == early_rise1[pt_i%4])
            early2_match_rise3_r[pt_i] <= #TCQ 1'b1;
          else
            early2_match_rise3_r[pt_i] <= #TCQ 1'b0;

          if (sr_fall3_r[pt_i] == early_fall1[pt_i%4])
            early2_match_fall3_r[pt_i] <= #TCQ 1'b1;
          else
            early2_match_fall3_r[pt_i] <= #TCQ 1'b0;
        end