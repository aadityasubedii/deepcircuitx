  always @(posedge clk)
    if (rst) begin
      prbs_dqs_tap_cnt_r   <= #TCQ 'b0;
      rdlvl_cpt_tap_cnt    <= #TCQ 'b0;
    end else if (new_cnt_dqs_r) begin
      prbs_dqs_tap_cnt_r   <= #TCQ pi_counter_read_val;
      rdlvl_cpt_tap_cnt    <= #TCQ pi_counter_read_val;
    end else if (prbs_tap_en_r) begin
      if (prbs_tap_inc_r)
        prbs_dqs_tap_cnt_r <= #TCQ prbs_dqs_tap_cnt_r + 1;
      else if (prbs_dqs_tap_cnt_r != 'd0)
        prbs_dqs_tap_cnt_r <= #TCQ prbs_dqs_tap_cnt_r - 1;
    end