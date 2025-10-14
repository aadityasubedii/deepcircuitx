    always @(posedge clk)
      if (rst || (rdlvl_stg1_start && ~rdlvl_stg1_start_r)) begin
        dbg_cpt_first_edge_taps  <= #TCQ 'b0;
        dbg_cpt_second_edge_taps <= #TCQ 'b0;
      end else if ((SIM_CAL_OPTION == "FAST_CAL") & (cal1_state_r1 == CAL1_CALC_IDEL)) begin
        
          for (ce_i = 0; ce_i < DQS_WIDTH; ce_i = ce_i + 1) begin: gen_dbg_cpt_edge
            if (found_first_edge_r)
              dbg_cpt_first_edge_taps[(6*ce_i)+:6]
                  <= #TCQ first_edge_taps_r;
            if (found_second_edge_r)
              dbg_cpt_second_edge_taps[(6*ce_i)+:6]
                  <= #TCQ second_edge_taps_r;
          end
        
      end else if (cal1_state_r == CAL1_CALC_IDEL) begin
        
        
        
          if (found_first_edge_r)
            dbg_cpt_first_edge_taps[((cal1_cnt_cpt_timing <<2) + (cal1_cnt_cpt_timing <<1))+:6]
              <= #TCQ first_edge_taps_r;
          if (found_second_edge_r)
            dbg_cpt_second_edge_taps[((cal1_cnt_cpt_timing <<2) + (cal1_cnt_cpt_timing <<1))+:6]
              <= #TCQ second_edge_taps_r;
      end
  endgenerate