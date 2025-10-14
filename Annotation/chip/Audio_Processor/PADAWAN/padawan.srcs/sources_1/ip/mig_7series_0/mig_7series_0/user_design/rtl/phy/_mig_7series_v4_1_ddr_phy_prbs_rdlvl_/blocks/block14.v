      case (prbs_state_r)
        
        PRBS_IDLE: begin
          prbs_last_byte_done  <= #TCQ 1'b0;
          prbs_prech_req_r     <= #TCQ 1'b0;
          if (prbs_rdlvl_start && ~prbs_rdlvl_start_r) begin
            if (SIM_CAL_OPTION == "SKIP_CAL" || SIM_CAL_OPTION == "FAST_CAL") begin
              prbs_state_r  <= #TCQ PRBS_DONE;
              reset_rd_addr <= #TCQ 1'b1;
            end else begin
              new_cnt_dqs_r <= #TCQ 1'b1;            
              prbs_state_r  <= #TCQ PRBS_NEW_DQS_WAIT;
              fine_pi_dec_cnt <= #TCQ pi_counter_read_val;
            end
          end
        end