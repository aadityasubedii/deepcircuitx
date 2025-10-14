          for (ce_i = 0; ce_i < DQS_WIDTH; ce_i = ce_i + 1) begin: gen_dbg_cpt_edge
            if (found_first_edge_r)
              dbg_cpt_first_edge_taps[(6*ce_i)+:6]
                  <= #TCQ first_edge_taps_r;
            if (found_second_edge_r)
              dbg_cpt_second_edge_taps[(6*ce_i)+:6]
                  <= #TCQ second_edge_taps_r;
          end