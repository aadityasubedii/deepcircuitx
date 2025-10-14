        always @(posedge clk) begin
          if (sr_rise0_r[pt_i] == early2_rise0[pt_i%4])
            early2_match_rise0_r[pt_i] <= #TCQ 1'b1;
          else
            early2_match_rise0_r[pt_i] <= #TCQ 1'b0;

          if (sr_fall0_r[pt_i] == early2_fall0[pt_i%4])
            early2_match_fall0_r[pt_i] <= #TCQ 1'b1;
          else
            early2_match_fall0_r[pt_i] <= #TCQ 1'b0;

          if (sr_rise1_r[pt_i] == early2_rise1[pt_i%4])
            early2_match_rise1_r[pt_i] <= #TCQ 1'b1;
          else
            early2_match_rise1_r[pt_i] <= #TCQ 1'b0;

          if (sr_fall1_r[pt_i] == early2_fall1[pt_i%4])
            early2_match_fall1_r[pt_i] <= #TCQ 1'b1;
          else
            early2_match_fall1_r[pt_i] <= #TCQ 1'b0;
        end