  always @(posedge clk)
    if (rst) begin
      prbs_dqs_cnt_r        <= #TCQ 'b0;
      prbs_tap_en_r         <= #TCQ 1'b0;
      prbs_tap_inc_r        <= #TCQ 1'b0;
      prbs_prech_req_r      <= #TCQ 1'b0;
      prbs_state_r          <= #TCQ PRBS_IDLE;
      prbs_found_1st_edge_r <= #TCQ 1'b0;
      prbs_found_2nd_edge_r <= #TCQ 1'b0;
      prbs_1st_edge_taps_r  <= #TCQ 6'bxxxxxx;
      prbs_inc_tap_cnt      <= #TCQ 'b0;
      prbs_dec_tap_cnt      <= #TCQ 'b0;
      new_cnt_dqs_r         <= #TCQ 1'b0;
      if (SIM_CAL_OPTION == "FAST_CAL")
        prbs_rdlvl_done       <= #TCQ 1'b1;
      else
        prbs_rdlvl_done       <= #TCQ 1'b0;
      prbs_2nd_edge_taps_r  <= #TCQ 6'bxxxxxx;
      prbs_last_byte_done   <= #TCQ 1'b0;
      prbs_tap_mod          <= #TCQ 'd0;
      reset_rd_addr         <= #TCQ 'b0;
      fine_pi_dec_cnt       <= #TCQ 'b0; 
      match_flag_and        <= #TCQ MATCH_ALL_ONE;
      match_flag_or         <= #TCQ MATCH_ALL_ONE;
      no_err_win_detected   <= #TCQ 1'b0; 
      no_err_win_detected_latch   <= #TCQ 1'b0; 
      valid_window_cnt      <= 2'd0;
      stage_cnt             <= #TCQ 2'b00;
      right_edge_found      <= #TCQ 1'b0;
      largest_left_edge     <= #TCQ 6'b000000;
      smallest_right_edge   <= #TCQ 6'b111111;
      num_samples_done_ind  <= #TCQ 'b0;
      fine_delay_sel        <= #TCQ 'b0;
      fine_dly_error        <= #TCQ 'b0;
      edge_det_error        <= #TCQ 'b0;
      complex_pi_incdec_done <= #TCQ 1'b0;
      complex_init_pi_dec_done_r <= #TCQ 1'b0;
    end else begin