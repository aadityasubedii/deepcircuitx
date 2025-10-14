      always @(posedge clk) begin
        
        
        
        
        
        
        if ((pat_data_match_r || mpr_valid_r1) && (sr_rise0_r[z] == old_sr_rise0_r[z]))
          old_sr_match_rise0_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          old_sr_match_rise0_r[z] <= #TCQ old_sr_match_rise0_r[z];
        else
          old_sr_match_rise0_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_fall0_r[z] == old_sr_fall0_r[z]))
          old_sr_match_fall0_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          old_sr_match_fall0_r[z] <= #TCQ old_sr_match_fall0_r[z];
        else
          old_sr_match_fall0_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_rise1_r[z] == old_sr_rise1_r[z]))
          old_sr_match_rise1_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          old_sr_match_rise1_r[z] <= #TCQ old_sr_match_rise1_r[z];
        else
          old_sr_match_rise1_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_fall1_r[z] == old_sr_fall1_r[z]))
          old_sr_match_fall1_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          old_sr_match_fall1_r[z] <= #TCQ old_sr_match_fall1_r[z];
        else
          old_sr_match_fall1_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_rise2_r[z] == old_sr_rise2_r[z]))
          old_sr_match_rise2_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          old_sr_match_rise2_r[z] <= #TCQ old_sr_match_rise2_r[z];
        else
          old_sr_match_rise2_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_fall2_r[z] == old_sr_fall2_r[z]))
          old_sr_match_fall2_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          old_sr_match_fall2_r[z] <= #TCQ old_sr_match_fall2_r[z];
        else
          old_sr_match_fall2_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_rise3_r[z] == old_sr_rise3_r[z]))
          old_sr_match_rise3_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          old_sr_match_rise3_r[z] <= #TCQ old_sr_match_rise3_r[z];
        else
          old_sr_match_rise3_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_fall3_r[z] == old_sr_fall3_r[z]))
          old_sr_match_fall3_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          old_sr_match_fall3_r[z] <= #TCQ old_sr_match_fall3_r[z];
        else
          old_sr_match_fall3_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_rise0_r[z] == prev_sr_rise0_r[z]))
          prev_sr_match_rise0_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          prev_sr_match_rise0_r[z] <= #TCQ prev_sr_match_rise0_r[z];
        else
          prev_sr_match_rise0_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_fall0_r[z] == prev_sr_fall0_r[z]))
          prev_sr_match_fall0_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          prev_sr_match_fall0_r[z] <= #TCQ prev_sr_match_fall0_r[z];
        else
          prev_sr_match_fall0_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_rise1_r[z] == prev_sr_rise1_r[z]))
          prev_sr_match_rise1_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          prev_sr_match_rise1_r[z] <= #TCQ prev_sr_match_rise1_r[z];
        else
          prev_sr_match_rise1_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_fall1_r[z] == prev_sr_fall1_r[z]))
          prev_sr_match_fall1_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          prev_sr_match_fall1_r[z] <= #TCQ prev_sr_match_fall1_r[z];
        else
          prev_sr_match_fall1_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_rise2_r[z] == prev_sr_rise2_r[z]))
          prev_sr_match_rise2_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          prev_sr_match_rise2_r[z] <= #TCQ prev_sr_match_rise2_r[z];
        else
          prev_sr_match_rise2_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_fall2_r[z] == prev_sr_fall2_r[z]))
          prev_sr_match_fall2_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          prev_sr_match_fall2_r[z] <= #TCQ prev_sr_match_fall2_r[z];
        else
          prev_sr_match_fall2_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_rise3_r[z] == prev_sr_rise3_r[z]))
          prev_sr_match_rise3_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          prev_sr_match_rise3_r[z] <= #TCQ prev_sr_match_rise3_r[z];
        else
          prev_sr_match_rise3_r[z] <= #TCQ 1'b0;

        if ((pat_data_match_r || mpr_valid_r1) && (sr_fall3_r[z] == prev_sr_fall3_r[z]))
          prev_sr_match_fall3_r[z] <= #TCQ 1'b1;
        else if (~mpr_valid_r1 && mpr_rdlvl_start && ~mpr_rdlvl_done_r)
          prev_sr_match_fall3_r[z] <= #TCQ prev_sr_match_fall3_r[z];
        else
          prev_sr_match_fall3_r[z] <= #TCQ 1'b0;

        
        
        
          old_sr_match_cyc2_r[z] <= #TCQ
                                    old_sr_match_rise0_r[z] &
                                  old_sr_match_fall0_r[z] &
                                  old_sr_match_rise1_r[z] &
                                  old_sr_match_fall1_r[z] &
                                  old_sr_match_rise2_r[z] &
                                  old_sr_match_fall2_r[z] &
                                  old_sr_match_rise3_r[z] &
                                  old_sr_match_fall3_r[z];
          prev_sr_match_cyc2_r[z] <= #TCQ
                                     prev_sr_match_rise0_r[z] &
                                   prev_sr_match_fall0_r[z] &
                                   prev_sr_match_rise1_r[z] &
                                   prev_sr_match_fall1_r[z] &
                                   prev_sr_match_rise2_r[z] &
                                   prev_sr_match_fall2_r[z] &
                                   prev_sr_match_rise3_r[z] &
                                   prev_sr_match_fall3_r[z];

        
        
        
        if (sr_valid_r2 || mpr_valid_r2) begin
          old_sr_diff_r[z]  <= #TCQ ~old_sr_match_cyc2_r[z];
          prev_sr_diff_r[z] <= #TCQ ~prev_sr_match_cyc2_r[z];
        end else begin
          old_sr_diff_r[z]  <= #TCQ 'b0;
          prev_sr_diff_r[z] <= #TCQ 'b0;
        end
        end
      end