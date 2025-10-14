      always @(posedge clk) begin
        if (sr_valid_r || mpr_valid_r) begin
          
          prev_sr_rise0_r[z] <= #TCQ sr_rise0_r[z];
          prev_sr_fall0_r[z] <= #TCQ sr_fall0_r[z];
          prev_sr_rise1_r[z] <= #TCQ sr_rise1_r[z];
          prev_sr_fall1_r[z] <= #TCQ sr_fall1_r[z];
          prev_sr_rise2_r[z] <= #TCQ sr_rise2_r[z];
          prev_sr_fall2_r[z] <= #TCQ sr_fall2_r[z];
          prev_sr_rise3_r[z] <= #TCQ sr_rise3_r[z];
          prev_sr_fall3_r[z] <= #TCQ sr_fall3_r[z];
        end
        if ((sr_valid_r || mpr_valid_r) && store_sr_r) begin
          old_sr_rise0_r[z] <= #TCQ sr_rise0_r[z];
          old_sr_fall0_r[z] <= #TCQ sr_fall0_r[z];
          old_sr_rise1_r[z] <= #TCQ sr_rise1_r[z];
          old_sr_fall1_r[z] <= #TCQ sr_fall1_r[z];
          old_sr_rise2_r[z] <= #TCQ sr_rise2_r[z];
          old_sr_fall2_r[z] <= #TCQ sr_fall2_r[z];
          old_sr_rise3_r[z] <= #TCQ sr_rise3_r[z];
          old_sr_fall3_r[z] <= #TCQ sr_fall3_r[z];
        end
      end