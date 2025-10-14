  always @(posedge clk) begin
    if (rst) begin
      wrcal_dqs_cnt_r       <= #TCQ 'b0;
      cal2_done_r           <= #TCQ 1'b0;
      cal2_prech_req_r      <= #TCQ 1'b0;
      cal2_state_r          <= #TCQ CAL2_IDLE;
      wrcal_pat_err         <= #TCQ 1'b0;
      wrcal_pat_resume_r    <= #TCQ 1'b0;
      wrcal_act_req         <= #TCQ 1'b0;
      cal2_if_reset         <= #TCQ 1'b0;
      temp_wrcal_done       <= #TCQ 1'b0;
      wrlvl_byte_redo       <= #TCQ 1'b0;
      early1_data           <= #TCQ 1'b0;
      early2_data           <= #TCQ 1'b0;
      idelay_ld             <= #TCQ 1'b0;
      idelay_ld_done        <= #TCQ 1'b0;
      pat1_detect           <= #TCQ 1'b0;
      early1_detect         <= #TCQ 1'b0;
      wrcal_sanity_chk_done <= #TCQ 1'b0;
      wrcal_sanity_chk_err  <= #TCQ 1'b0;
    end else begin
      cal2_prech_req_r <= #TCQ 1'b0;
      case (cal2_state_r)
        CAL2_IDLE: begin
          wrcal_pat_err         <= #TCQ 1'b0;
          if (wrcal_start) begin
            cal2_if_reset  <= #TCQ 1'b0;
            if (SIM_CAL_OPTION == "SKIP_CAL")
              
              cal2_state_r <= #TCQ CAL2_DONE;
            else
              cal2_state_r <= #TCQ CAL2_READ_WAIT;
          end
        end

        
        
        CAL2_READ_WAIT: begin
          wrcal_pat_resume_r <= #TCQ 1'b0;
          cal2_if_reset      <= #TCQ 1'b0;
          
          
          
          
          if (pat_data_match_valid_r && (nCK_PER_CLK == 4)) begin
            if (pat_data_match_r)
              
              cal2_state_r <= #TCQ CAL2_NEXT_DQS;
            else begin
              if (wrcal_sanity_chk_r)
                cal2_state_r <= #TCQ CAL2_ERR;
              
              
              else if (early1_data_match_r) begin
                early1_data <= #TCQ 1'b1;
                early2_data <= #TCQ 1'b0;
                wrlvl_byte_redo <= #TCQ 1'b1;
                cal2_state_r    <= #TCQ CAL2_WRLVL_WAIT;
              end else if (early2_data_match_r) begin
                early1_data <= #TCQ 1'b0;
                early2_data <= #TCQ 1'b1;
                wrlvl_byte_redo <= #TCQ 1'b1;
                cal2_state_r    <= #TCQ CAL2_WRLVL_WAIT;
              
              
              end else if (~idelay_ld_done) begin
                cal2_state_r <= #TCQ CAL2_DQ_IDEL_DEC;
                idelay_ld    <= #TCQ 1'b1;
              end else
                cal2_state_r <= #TCQ CAL2_ERR;
            end
          end else if (pat_data_match_valid_r && (nCK_PER_CLK == 2)) begin
            if ((pat1_data_match_r1 && pat2_data_match_r) ||
                (pat1_detect && pat2_data_match_r))
              
              cal2_state_r <= #TCQ CAL2_NEXT_DQS;
            else if (pat1_data_match_r1 && ~pat2_data_match_r) begin
              cal2_state_r <= #TCQ CAL2_READ_WAIT;
              pat1_detect  <= #TCQ 1'b1;
            end else begin
              
              
              if (wrcal_sanity_chk_r)
                cal2_state_r <= #TCQ CAL2_ERR;
              else if ((early1_data_match_r1 && early2_data_match_r) ||
                  (early1_detect && early2_data_match_r)) begin
                early1_data <= #TCQ 1'b1;
                early2_data <= #TCQ 1'b0;
                wrlvl_byte_redo <= #TCQ 1'b1;
                cal2_state_r    <= #TCQ CAL2_WRLVL_WAIT;
              end else if (early1_data_match_r1 && ~early2_data_match_r) begin
                early1_detect <= #TCQ 1'b1;
                cal2_state_r  <= #TCQ CAL2_READ_WAIT;
              
              
              end else if (~idelay_ld_done) begin
                cal2_state_r <= #TCQ CAL2_DQ_IDEL_DEC;
                idelay_ld    <= #TCQ 1'b1;
              end else
                cal2_state_r <= #TCQ CAL2_ERR;
            end
          end else if (not_empty_wait_cnt == 'd31)
            cal2_state_r <= #TCQ CAL2_ERR;
        end

        CAL2_WRLVL_WAIT: begin
          early1_detect <= #TCQ 1'b0;
          if (wrlvl_byte_done && ~wrlvl_byte_done_r)
            wrlvl_byte_redo   <= #TCQ 1'b0;
          if (wrlvl_byte_done) begin
            if (rd_active_r1 && ~rd_active_r) begin
            cal2_state_r  <= #TCQ CAL2_IFIFO_RESET;
            cal2_if_reset <= #TCQ 1'b1;
            early1_data   <= #TCQ 1'b0;
            early2_data   <= #TCQ 1'b0;
          end
        end
        end

        CAL2_DQ_IDEL_DEC: begin
          if (tap_inc_wait_cnt == 'd4) begin
            idelay_ld      <= #TCQ 1'b0;
            cal2_state_r   <= #TCQ CAL2_IFIFO_RESET;
            cal2_if_reset  <= #TCQ 1'b1;
            idelay_ld_done <= #TCQ 1'b1;
          end
        end

        CAL2_IFIFO_RESET: begin
          if (tap_inc_wait_cnt == 'd15) begin
            cal2_if_reset      <= #TCQ 1'b0;
            if (wrcal_sanity_chk_r)
              cal2_state_r       <= #TCQ CAL2_DONE;
            else if (idelay_ld_done) begin
              wrcal_pat_resume_r <= #TCQ 1'b1;
              cal2_state_r       <= #TCQ CAL2_READ_WAIT;
            end else
              cal2_state_r       <= #TCQ CAL2_IDLE;
          end
        end

        
        CAL2_NEXT_DQS: begin
          
          

          
          
                    
          if (wrcal_sanity_chk_r && (wrcal_dqs_cnt_r != DQS_WIDTH-1)) begin
            cal2_prech_req_r   <= #TCQ 1'b0;
            wrcal_dqs_cnt_r    <= #TCQ wrcal_dqs_cnt_r + 1;
            cal2_state_r       <= #TCQ CAL2_SANITY_WAIT;
          end else
            cal2_prech_req_r  <= #TCQ 1'b1;
          idelay_ld_done    <= #TCQ 1'b0;
          pat1_detect       <= #TCQ 1'b0;
          if (prech_done)
            if (((DQS_WIDTH == 1) || (SIM_CAL_OPTION == "FAST_CAL")) ||
                (wrcal_dqs_cnt_r == DQS_WIDTH-1)) begin
              
              
              
              if (wrcal_sanity_chk_r) begin
                cal2_if_reset    <= #TCQ 1'b1;
                cal2_state_r     <= #TCQ CAL2_IFIFO_RESET;
              end else
                cal2_state_r     <= #TCQ CAL2_DONE;
            end else begin
              
              wrcal_dqs_cnt_r    <= #TCQ wrcal_dqs_cnt_r + 1;
              cal2_state_r       <= #TCQ CAL2_READ_WAIT;
            end
        end
    
        CAL2_SANITY_WAIT: begin
          if (tap_inc_wait_cnt == 'd15) begin
            cal2_state_r       <= #TCQ CAL2_READ_WAIT;
            wrcal_pat_resume_r <= #TCQ 1'b1;
          end
        end

        
        CAL2_DONE: begin
          if (wrcal_sanity_chk && ~wrcal_sanity_chk_r) begin
            cal2_done_r     <= #TCQ 1'b0;
            wrcal_dqs_cnt_r <= #TCQ 'd0;
            cal2_state_r    <= #TCQ CAL2_IDLE;
          end else
            cal2_done_r      <= #TCQ 1'b1;
            cal2_prech_req_r <= #TCQ 1'b0;
            cal2_if_reset    <= #TCQ 1'b0;
            if (wrcal_sanity_chk_r)
              wrcal_sanity_chk_done <= #TCQ 1'b1;
        end

        
        CAL2_ERR: begin
          wrcal_pat_resume_r <= #TCQ 1'b0;
          if (wrcal_sanity_chk_r)
            wrcal_sanity_chk_err <= #TCQ 1'b1;
          else
            wrcal_pat_err      <= #TCQ 1'b1;
          cal2_state_r       <= #TCQ CAL2_ERR;
        end
      endcase
    end
  end