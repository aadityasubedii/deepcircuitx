        always @(posedge clk) begin
          if (sr_rise0_r[pt_i] == idel_pat0_rise0[pt_i%4])
            idel_pat0_match_rise0_r[pt_i] <= #TCQ 1'b1;
          else
            idel_pat0_match_rise0_r[pt_i] <= #TCQ 1'b0;

          if (sr_fall0_r[pt_i] == idel_pat0_fall0[pt_i%4])
            idel_pat0_match_fall0_r[pt_i] <= #TCQ 1'b1;
          else
            idel_pat0_match_fall0_r[pt_i] <= #TCQ 1'b0;

          if (sr_rise1_r[pt_i] == idel_pat0_rise1[pt_i%4])
            idel_pat0_match_rise1_r[pt_i] <= #TCQ 1'b1;
          else
            idel_pat0_match_rise1_r[pt_i] <= #TCQ 1'b0;

          if (sr_fall1_r[pt_i] == idel_pat0_fall1[pt_i%4])
            idel_pat0_match_fall1_r[pt_i] <= #TCQ 1'b1;
          else
            idel_pat0_match_fall1_r[pt_i] <= #TCQ 1'b0;

          if (sr_rise2_r[pt_i] == idel_pat0_rise2[pt_i%4])
            idel_pat0_match_rise2_r[pt_i] <= #TCQ 1'b1;
          else
            idel_pat0_match_rise2_r[pt_i] <= #TCQ 1'b0;

          if (sr_fall2_r[pt_i] == idel_pat0_fall2[pt_i%4])
            idel_pat0_match_fall2_r[pt_i] <= #TCQ 1'b1;
          else
            idel_pat0_match_fall2_r[pt_i] <= #TCQ 1'b0;

          if (sr_rise3_r[pt_i] == idel_pat0_rise3[pt_i%4])
            idel_pat0_match_rise3_r[pt_i] <= #TCQ 1'b1;
          else
            idel_pat0_match_rise3_r[pt_i] <= #TCQ 1'b0;

          if (sr_fall3_r[pt_i] == idel_pat0_fall3[pt_i%4])
            idel_pat0_match_fall3_r[pt_i] <= #TCQ 1'b1;
          else
            idel_pat0_match_fall3_r[pt_i] <= #TCQ 1'b0;
        end