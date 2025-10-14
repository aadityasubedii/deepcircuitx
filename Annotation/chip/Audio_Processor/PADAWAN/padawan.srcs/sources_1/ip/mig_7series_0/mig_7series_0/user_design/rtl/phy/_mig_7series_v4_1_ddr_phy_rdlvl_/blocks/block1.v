  always @(posedge clk)
    if (rst) begin
      cal1_cnt_cpt_r        <= #TCQ 'b0;
      cal1_dlyce_cpt_r      <= #TCQ 1'b0;
      cal1_dlyinc_cpt_r     <= #TCQ 1'b0;
      cal1_dq_idel_ce       <= #TCQ 1'b0;
      cal1_dq_idel_inc      <= #TCQ 1'b0;
      cal1_prech_req_r      <= #TCQ 1'b0;
      cal1_state_r          <= #TCQ CAL1_IDLE;
      cnt_idel_dec_cpt_r    <= #TCQ 6'bxxxxxx;
      found_first_edge_r    <= #TCQ 1'b0;
      found_second_edge_r   <= #TCQ 1'b0;
      right_edge_taps_r     <= #TCQ 6'b000000;
      first_edge_taps_r     <= #TCQ 6'bxxxxxx;
      new_cnt_cpt_r         <= #TCQ 1'b0;
      rdlvl_stg1_done_int       <= #TCQ 1'b0;
      rdlvl_stg1_err        <= #TCQ 1'b0;
      second_edge_taps_r    <= #TCQ 6'bxxxxxx;
      store_sr_req_pulsed_r <= #TCQ 1'b0;
      store_sr_req_r        <= #TCQ 1'b0;
      rnk_cnt_r             <= #TCQ 2'b00;
      rdlvl_rank_done_r     <= #TCQ 1'b0;
      idel_dec_cnt          <= #TCQ 'd0;
      rdlvl_last_byte_done_int  <= #TCQ 1'b0;
      idel_pat_detect_valid_r <= #TCQ 1'b0;
      mpr_rank_done_r       <= #TCQ 1'b0;
      mpr_last_byte_done    <= #TCQ 1'b0;
      idel_adj_inc          <= #TCQ 1'b0;
      if (OCAL_EN == "ON")
        mpr_rdlvl_done_r      <= #TCQ 1'b0;
      else
        mpr_rdlvl_done_r      <= #TCQ 1'b1;
        mpr_dec_cpt_r           <= #TCQ 1'b0;
        rdlvl_pi_incdec         <= #TCQ 1'b0;
    end else begin
      
      
      cal1_prech_req_r    <= #TCQ 1'b0;
      cal1_dlyce_cpt_r    <= #TCQ 1'b0;
      cal1_dlyinc_cpt_r   <= #TCQ 1'b0;
      cal1_dq_idel_ce     <= #TCQ 1'b0;
      cal1_dq_idel_inc    <= #TCQ 1'b0;
      new_cnt_cpt_r       <= #TCQ 1'b0;
      store_sr_req_pulsed_r <= #TCQ 1'b0;
      store_sr_req_r      <= #TCQ 1'b0;

      case (cal1_state_r)

        CAL1_IDLE: begin
          rdlvl_rank_done_r    <= #TCQ 1'b0;
          rdlvl_last_byte_done_int <= #TCQ 1'b0;
          mpr_rank_done_r      <= #TCQ 1'b0;
          mpr_last_byte_done   <= #TCQ 1'b0;
          if (mpr_rdlvl_start && ~mpr_rdlvl_start_r) begin
            rdlvl_pi_incdec <= #TCQ 1'b0;
            cal1_state_r  <= #TCQ CAL1_MPR_NEW_DQS_WAIT;
          end else begin
            rdlvl_pi_incdec    <= #TCQ 1'b1;
            if (rdlvl_stg1_start && ~rdlvl_stg1_start_r) begin
              if (SIM_CAL_OPTION == "SKIP_CAL")
                cal1_state_r  <= #TCQ CAL1_REGL_LOAD;
              else if (SIM_CAL_OPTION == "FAST_CAL")
                cal1_state_r  <= #TCQ CAL1_NEXT_DQS;
              else begin
                new_cnt_cpt_r <= #TCQ 1'b1;
                cal1_state_r  <= #TCQ CAL1_NEW_DQS_WAIT;
              end
            end
          end
        end

        CAL1_MPR_NEW_DQS_WAIT: begin
          cal1_prech_req_r  <= #TCQ 1'b0;
          if (!cal1_wait_r && mpr_valid_r)
            cal1_state_r <= #TCQ CAL1_MPR_PAT_DETECT;
        end

        
        
        
        CAL1_NEW_DQS_WAIT: begin
          rdlvl_rank_done_r    <= #TCQ 1'b0;
          rdlvl_last_byte_done_int <= #TCQ 1'b0;
          mpr_rank_done_r      <= #TCQ 1'b0;
          mpr_last_byte_done   <= #TCQ 1'b0;
          cal1_prech_req_r     <= #TCQ 1'b0;
          if (|pi_counter_read_val) begin 
            mpr_dec_cpt_r      <= #TCQ 1'b1;
            cal1_state_r       <= #TCQ CAL1_IDEL_DEC_CPT;
            cnt_idel_dec_cpt_r <= #TCQ pi_counter_read_val;
            rdlvl_pi_incdec    <= #TCQ 1'b1;  
          end else if (!cal1_wait_r) begin
            rdlvl_pi_incdec <= #TCQ 1'b0;

            
            
            
            
            store_sr_req_r <= #TCQ 1'b1;
            
            
            if (PER_BIT_DESKEW == "OFF")
              cal1_state_r <= #TCQ CAL1_STORE_FIRST_WAIT;
            else if (PER_BIT_DESKEW == "ON")
              cal1_state_r <= #TCQ CAL1_PB_STORE_FIRST_WAIT;
          end else
            rdlvl_pi_incdec    <= #TCQ 1'b1;  
        end
        
        
        

        
        CAL1_PB_STORE_FIRST_WAIT:
          if (!cal1_wait_r)
            cal1_state_r <= #TCQ CAL1_PB_DETECT_EDGE;

        
        CAL1_PB_DETECT_EDGE:
          if (detect_edge_done_r) begin
            if (found_stable_eye_r) begin
              
              
              
              
              cnt_idel_dec_cpt_r <= #TCQ MIN_EYE_SIZE + 1;
              cal1_state_r       <= #TCQ CAL1_PB_DEC_CPT_LEFT;
            end else begin
              
              
              if (!tap_limit_cpt_r) begin
                
                
                
                store_sr_req_r <= #TCQ 1'b1;
                cal1_state_r    <= #TCQ CAL1_PB_INC_CPT;
              end else begin
                
                
                
                
                
                cnt_idel_dec_cpt_r <= #TCQ 6'd63;
                cal1_state_r       <= #TCQ CAL1_PB_DEC_CPT;
              end
            end
          end

        
        CAL1_PB_INC_CPT: begin
          cal1_dlyce_cpt_r  <= #TCQ 1'b1;
          cal1_dlyinc_cpt_r <= #TCQ 1'b1;
          cal1_state_r      <= #TCQ CAL1_PB_INC_CPT_WAIT;
        end

        
        
        CAL1_PB_INC_CPT_WAIT: begin
          cal1_dlyce_cpt_r  <= #TCQ 1'b0;
          cal1_dlyinc_cpt_r <= #TCQ 1'b0;
          if (!cal1_wait_r) begin
            cal1_state_r <= #TCQ CAL1_PB_DETECT_EDGE;

          end
        end
        
        
        
        CAL1_PB_DEC_CPT_LEFT:
          if (cnt_idel_dec_cpt_r == 6'b000000)
            cal1_state_r <= #TCQ CAL1_PB_DEC_CPT_LEFT_WAIT;
          else begin
            cal1_dlyce_cpt_r   <= #TCQ 1'b1;
            cal1_dlyinc_cpt_r  <= #TCQ 1'b0;
            cnt_idel_dec_cpt_r <= #TCQ cnt_idel_dec_cpt_r - 1;
          end

        CAL1_PB_DEC_CPT_LEFT_WAIT:
          if (!cal1_wait_r)
            cal1_state_r <= #TCQ CAL1_PB_DETECT_EDGE_DQ;

        
        
        
        
        
        CAL1_PB_DETECT_EDGE_DQ:
          if (detect_edge_done_r)
            if (found_edge_all_r) begin
              
              
              
              
              cnt_idel_dec_cpt_r <= #TCQ tap_cnt_cpt_r;
              cal1_state_r       <= #TCQ CAL1_PB_DEC_CPT;
            end else
              if (!idel_tap_limit_dq_pb_r)
                
                
                cal1_state_r <= #TCQ CAL1_PB_INC_DQ;
              else begin
                
                
                cnt_idel_dec_cpt_r <= #TCQ tap_cnt_cpt_r;
                cal1_state_r <= #TCQ CAL1_PB_DEC_CPT;
              end

        CAL1_PB_INC_DQ: begin
          
          cal1_dlyce_dq_r  <= #TCQ ~pb_found_edge_last_r;
          cal1_dlyinc_dq_r <= #TCQ 1'b1;
          cal1_state_r     <= #TCQ CAL1_PB_INC_DQ_WAIT;
        end

        CAL1_PB_INC_DQ_WAIT:
          if (!cal1_wait_r)
            cal1_state_r <= #TCQ CAL1_PB_DETECT_EDGE_DQ;

        
        CAL1_PB_DEC_CPT:
          if (cnt_idel_dec_cpt_r == 6'b000000)
            cal1_state_r <= #TCQ CAL1_PB_DEC_CPT_WAIT;
          else begin
            cal1_dlyce_cpt_r   <= #TCQ 1'b1;
            cal1_dlyinc_cpt_r  <= #TCQ 1'b0;
            cnt_idel_dec_cpt_r <= #TCQ cnt_idel_dec_cpt_r - 1;
          end

        
        
        CAL1_PB_DEC_CPT_WAIT:
          if (!cal1_wait_r) begin
            store_sr_req_r <= #TCQ 1'b1;
            cal1_state_r    <= #TCQ CAL1_STORE_FIRST_WAIT;
          end

        
        
        
        
        
        
        
        
        CAL1_STORE_FIRST_WAIT: begin
          mpr_dec_cpt_r  <= #TCQ 1'b0;
          if (!cal1_wait_r)
            cal1_state_r <= #TCQ CAL1_PAT_DETECT;
        end

        CAL1_VALID_WAIT: begin
          if (!cal1_wait_r)
            cal1_state_r <= #TCQ CAL1_MPR_PAT_DETECT;
        end

        CAL1_MPR_PAT_DETECT: begin
          rdlvl_pi_incdec <= #TCQ 1'b0;
          
          
          if (idel_pat_detect_valid_r == 1'b0) begin
            cal1_state_r  <= #TCQ CAL1_VALID_WAIT;
            idel_pat_detect_valid_r <= #TCQ 1'b1;
          end else if (idel_pat_detect_valid_r && idel_mpr_pat_detect_r) begin
            cal1_state_r  <= #TCQ CAL1_DETECT_EDGE;
            idel_dec_cnt  <= #TCQ 'd0;
          end else if (!idelay_tap_limit_r)
            cal1_state_r  <= #TCQ CAL1_DQ_IDEL_TAP_INC;
          else
            cal1_state_r  <= #TCQ CAL1_RDLVL_ERR;
        end

        CAL1_PAT_DETECT: begin
          
          
          
          
          
          rdlvl_pi_incdec <= #TCQ 1'b0;
          if (detect_edge_done_r) begin
            if (idel_pat_data_match) begin
              case (idelay_adj)
                2'b01: begin
                  cal1_state_r <= CAL1_DQ_IDEL_TAP_INC;
                  idel_dec_cnt <= #TCQ 5'd0;
                  idel_adj_inc <= #TCQ 1'b1;
                end
                2'b10: begin   
                  cal1_state_r  <= #TCQ  CAL1_DQ_IDEL_TAP_DEC ;
                  idel_dec_cnt  <= #TCQ 5'd1;
                  idel_adj_inc  <= #TCQ 1'b0;
                end
                default: begin
                  cal1_state_r  <= #TCQ CAL1_DETECT_EDGE;
                  idel_dec_cnt  <= #TCQ 5'd0;
                  idel_adj_inc  <= #TCQ 1'b0;
                end
              endcase
            end else if (!idelay_tap_limit_r) begin
              cal1_state_r  <= #TCQ CAL1_DQ_IDEL_TAP_INC;
            end else begin
              cal1_state_r  <= #TCQ CAL1_RDLVL_ERR;
            end
          end
        end

        
        
        CAL1_DQ_IDEL_TAP_INC: begin
          cal1_dq_idel_ce         <= #TCQ 1'b1;
          cal1_dq_idel_inc        <= #TCQ 1'b1;
          cal1_state_r            <= #TCQ CAL1_DQ_IDEL_TAP_INC_WAIT;
          idel_pat_detect_valid_r <= #TCQ 1'b0;
        end

        CAL1_DQ_IDEL_TAP_INC_WAIT: begin
          cal1_dq_idel_ce     <= #TCQ 1'b0;
          cal1_dq_idel_inc    <= #TCQ 1'b0;
          if (!cal1_wait_r) begin
            idel_adj_inc        <= #TCQ 1'b0;
            if (idel_adj_inc)
              cal1_state_r <= #TCQ CAL1_DETECT_EDGE;
            else  if (~mpr_rdlvl_done_r & (DRAM_TYPE == "DDR3"))
              cal1_state_r <= #TCQ CAL1_MPR_PAT_DETECT;
            else
              cal1_state_r <= #TCQ CAL1_PAT_DETECT;
          end
        end

        
        CAL1_DQ_IDEL_TAP_DEC: begin
          cal1_dq_idel_inc    <= #TCQ 1'b0;
          cal1_state_r        <= #TCQ CAL1_DQ_IDEL_TAP_DEC_WAIT;
          if (idel_dec_cnt >= 'd0)
            cal1_dq_idel_ce     <= #TCQ 1'b1;
          else
            cal1_dq_idel_ce     <= #TCQ 1'b0;
          if (idel_dec_cnt > 'd0)
            idel_dec_cnt <= #TCQ idel_dec_cnt - 1;
          else
            idel_dec_cnt <= #TCQ idel_dec_cnt;
        end

        CAL1_DQ_IDEL_TAP_DEC_WAIT: begin
          cal1_dq_idel_ce     <= #TCQ 1'b0;
          cal1_dq_idel_inc    <= #TCQ 1'b0;
          if (!cal1_wait_r) begin
            if ((idel_dec_cnt > 'd0) || (pi_rdval_cnt > 'd0))
              cal1_state_r <= #TCQ CAL1_DQ_IDEL_TAP_DEC;
            else if (mpr_dec_cpt_r)
              cal1_state_r <= #TCQ CAL1_STORE_FIRST_WAIT;
            else
              cal1_state_r <= #TCQ CAL1_DETECT_EDGE;
          end
        end

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        CAL1_DETECT_EDGE: begin
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          

          
          
          
          
          
          idel_pat_detect_valid_r <= #TCQ 1'b0;
          if (!store_sr_req_pulsed_r) begin
            
            store_sr_req_r        <= #TCQ 1'b1;
            store_sr_req_pulsed_r <= #TCQ 1'b1;
          end else begin
            store_sr_req_r        <= #TCQ 1'b0;
            store_sr_req_pulsed_r <= #TCQ 1'b1;
          end

          
          
          
          if (detect_edge_done_r) begin
            if (tap_limit_cpt_r)
              
              
              
              
              
              
              
              
              cal1_state_r <= #TCQ CAL1_CALC_IDEL;
            else if (found_edge_r) begin
              
              
              
              found_first_edge_r <= #TCQ 1'b1;

              
              
              if (!found_first_edge_r && found_stable_eye_last_r) begin
                if (tap_cnt_cpt_r == 'd0)
                  right_edge_taps_r <= #TCQ 'd0;
                else
                  right_edge_taps_r <= #TCQ tap_cnt_cpt_r;
              end

              
              
              
              
              
              
              
              if (found_first_edge_r && found_stable_eye_last_r) begin
                found_second_edge_r <= #TCQ 1'b1;
                second_edge_taps_r <= #TCQ tap_cnt_cpt_r - 1;
                cal1_state_r <= #TCQ CAL1_CALC_IDEL;
              end else begin
                
                
                
                
                first_edge_taps_r <= #TCQ tap_cnt_cpt_r;
                
                cal1_state_r <= #TCQ CAL1_RD_STOP_FOR_PI_INC;
              end
            end else
              
              
              
              cal1_state_r <= #TCQ CAL1_RD_STOP_FOR_PI_INC;
          end
        end

        
        
        CAL1_RD_STOP_FOR_PI_INC: begin
          rdlvl_pi_incdec    <= #TCQ 1'b1;
          if (!cal1_wait_r)
            cal1_state_r    <= #TCQ CAL1_IDEL_INC_CPT;
        end

        
        CAL1_IDEL_INC_CPT: begin
          cal1_state_r        <= #TCQ CAL1_IDEL_INC_CPT_WAIT;
          if (~tap_limit_cpt_r) begin
            cal1_dlyce_cpt_r    <= #TCQ 1'b1;
            cal1_dlyinc_cpt_r   <= #TCQ 1'b1;
          end else begin
            cal1_dlyce_cpt_r    <= #TCQ 1'b0;
            cal1_dlyinc_cpt_r   <= #TCQ 1'b0;
          end
        end

        
        CAL1_IDEL_INC_CPT_WAIT: begin
          cal1_dlyce_cpt_r    <= #TCQ 1'b0;
          cal1_dlyinc_cpt_r   <= #TCQ 1'b0;
          if (!cal1_wait_r) begin
            cal1_state_r <= #TCQ CAL1_DETECT_EDGE;
            rdlvl_pi_incdec <= #TCQ 1'b0;    
          end
        end

        
        
        
        
        
        CAL1_CALC_IDEL: begin
         
          if (found_second_edge_r)
            cnt_idel_dec_cpt_r
              <=  #TCQ ((second_edge_taps_r -
                         first_edge_taps_r)>>1) + 1;
          else if (right_edge_taps_r > 6'd0)
            
            
            
            cnt_idel_dec_cpt_r
              <=  #TCQ (tap_cnt_cpt_r - (right_edge_taps_r>>1));
          else if (found_first_edge_r)
            
            cnt_idel_dec_cpt_r
              <=  #TCQ ((tap_cnt_cpt_r - first_edge_taps_r)>>1);
          else
            cnt_idel_dec_cpt_r
              <=  #TCQ (tap_cnt_cpt_r>>1);
          
          
          
          cal1_state_r <= #TCQ CAL1_CENTER_WAIT;
          rdlvl_pi_incdec <= #TCQ 1'b1;
        end

        CAL1_CENTER_WAIT: begin
          if(!cal1_wait_r)
            cal1_state_r <= #TCQ CAL1_IDEL_DEC_CPT;
        end
        
        
        
        
        
        CAL1_IDEL_DEC_CPT: begin
          cal1_dlyce_cpt_r  <= #TCQ 1'b1;
          cal1_dlyinc_cpt_r <= #TCQ 1'b0;
          
          
          cnt_idel_dec_cpt_r <= #TCQ cnt_idel_dec_cpt_r - 1;
          if (cnt_idel_dec_cpt_r == 6'b000001) begin
            if (mpr_dec_cpt_r) begin
              if (|idelay_tap_cnt_r[rnk_cnt_r][cal1_cnt_cpt_timing]) begin
                idel_dec_cnt  <= #TCQ idelay_tap_cnt_r[rnk_cnt_r][cal1_cnt_cpt_timing];
                cal1_state_r  <= #TCQ CAL1_DQ_IDEL_TAP_DEC;
              end else
                cal1_state_r  <= #TCQ CAL1_STORE_FIRST_WAIT;
            end else
              cal1_state_r <= #TCQ CAL1_NEXT_DQS;
          end else
            cal1_state_r <= #TCQ CAL1_IDEL_DEC_CPT_WAIT;
        end

        CAL1_IDEL_DEC_CPT_WAIT: begin
          cal1_dlyce_cpt_r  <= #TCQ 1'b0;
          cal1_dlyinc_cpt_r <= #TCQ 1'b0;
          if (!cal1_wait_r)
            cal1_state_r <= #TCQ CAL1_IDEL_DEC_CPT;
        end

        
        
        CAL1_NEXT_DQS: begin
          
            cal1_prech_req_r  <= #TCQ 1'b1;
          
          
          cal1_dlyce_cpt_r  <= #TCQ 1'b0;
          cal1_dlyinc_cpt_r <= #TCQ 1'b0;
          
          found_first_edge_r  <= #TCQ 1'b0;
          found_second_edge_r <= #TCQ 1'b0;
          first_edge_taps_r <= #TCQ 'd0;
          second_edge_taps_r <= #TCQ 'd0;
          right_edge_taps_r    <= #TCQ 'd0;
          if ((SIM_CAL_OPTION == "FAST_CAL") ||
              (cal1_cnt_cpt_r >= DQS_WIDTH-1)) begin
            if (mpr_rdlvl_done_r) begin
              rdlvl_last_byte_done_int <= #TCQ 1'b1;
              mpr_last_byte_done   <= #TCQ 1'b0;
            end else begin
              rdlvl_last_byte_done_int <= #TCQ 1'b0;
              mpr_last_byte_done   <= #TCQ 1'b1;
            end
          end

          
          
          if (prech_done) begin 
            if (SIM_CAL_OPTION == "FAST_CAL") begin
              
              rdlvl_last_byte_done_int <= #TCQ 1'b0;
              mpr_last_byte_done   <= #TCQ 1'b0;
              cal1_state_r <= #TCQ CAL1_DONE; 
            end else if (cal1_cnt_cpt_r >= DQS_WIDTH-1) begin
              if (~mpr_rdlvl_done_r) begin
                mpr_rank_done_r <= #TCQ 1'b1;
                
                  
                cal1_state_r <= #TCQ CAL1_DONE;
                cal1_cnt_cpt_r <= #TCQ 'b0;
                
                  
                  
                  
                  
                  
                
              end else begin
                
                rdlvl_rank_done_r <= #TCQ 1'b1;
                if (rnk_cnt_r == RANKS-1) begin
                  
                  cal1_state_r <= #TCQ CAL1_REGL_LOAD;
                end else begin
                  
                  rnk_cnt_r      <= #TCQ rnk_cnt_r + 1;
                  new_cnt_cpt_r  <= #TCQ 1'b1;
                  cal1_cnt_cpt_r <= #TCQ 'b0;
                  cal1_state_r   <= #TCQ CAL1_IDLE;
                end
              end
            end else begin
              
              new_cnt_cpt_r  <= #TCQ 1'b1;
              cal1_cnt_cpt_r <= #TCQ cal1_cnt_cpt_r + 1;
              cal1_state_r   <= #TCQ CAL1_NEW_DQS_PREWAIT;
            end
          end
        end

        CAL1_NEW_DQS_PREWAIT: begin
          if (!cal1_wait_r) begin
            rdlvl_pi_incdec <= #TCQ 1'b0;
            if (~mpr_rdlvl_done_r & (DRAM_TYPE == "DDR3"))
                cal1_state_r  <= #TCQ CAL1_MPR_NEW_DQS_WAIT;
            else
              cal1_state_r   <= #TCQ CAL1_NEW_DQS_WAIT;
          end
        end

        
        CAL1_REGL_LOAD: begin
          rdlvl_rank_done_r <= #TCQ 1'b0;
          mpr_rank_done_r   <= #TCQ 1'b0;
          cal1_prech_req_r  <= #TCQ 1'b0;
          cal1_cnt_cpt_r    <= #TCQ 'b0;
          rnk_cnt_r         <= #TCQ 2'b00;
          if ((regl_rank_cnt == RANKS-1) &&
              ((regl_dqs_cnt == DQS_WIDTH-1) && (done_cnt == 4'd1))) begin
            cal1_state_r <= #TCQ CAL1_DONE;
            rdlvl_last_byte_done_int <= #TCQ 1'b0;
            mpr_last_byte_done   <= #TCQ 1'b0;
          end else
            cal1_state_r <= #TCQ CAL1_REGL_LOAD;
        end

        CAL1_RDLVL_ERR: begin
          rdlvl_stg1_err <= #TCQ 1'b1;
        end

        
        
        CAL1_DONE: begin
          mpr_rdlvl_done_r  <= #TCQ 1'b1;
          cal1_prech_req_r  <= #TCQ 1'b0;
          if (~mpr_rdlvl_done_r && (OCAL_EN=="ON") && (DRAM_TYPE == "DDR3")) begin
            rdlvl_stg1_done_int   <= #TCQ 1'b0;
            cal1_state_r <= #TCQ CAL1_IDLE;
          end else
            rdlvl_stg1_done_int   <= #TCQ 1'b1;
        end

      endcase
    end





endmodule