      always @(posedge clk)
        if (rst)
          dlyce_dq_r[DRAM_WIDTH*z+:DRAM_WIDTH] <= #TCQ 'b0;
        else
          if (SIM_CAL_OPTION == "SKIP_CAL")
            
            
            dlyce_dq_r[DRAM_WIDTH*z+:DRAM_WIDTH] <= #TCQ 'b0;
          else if (SIM_CAL_OPTION == "FAST_CAL") begin
            
            
            
            for (h = 0; h < DRAM_WIDTH; h = h + 1) begin
              dlyce_dq_r[DRAM_WIDTH*z + h] <= #TCQ cal1_dlyce_dq_r;
            end
          end else if ((SIM_CAL_OPTION == "NONE") ||
                   (SIM_CAL_OPTION == "FAST_WIN_DETECT")) begin
            if (cal1_cnt_cpt_r == z) begin
              for (g = 0; g < DRAM_WIDTH; g = g + 1) begin
                dlyce_dq_r[DRAM_WIDTH*z + g]
                <= #TCQ cal1_dlyce_dq_r;
              end
            end else
              dlyce_dq_r[DRAM_WIDTH*z+:DRAM_WIDTH] <= #TCQ 'b0;
          end
    end