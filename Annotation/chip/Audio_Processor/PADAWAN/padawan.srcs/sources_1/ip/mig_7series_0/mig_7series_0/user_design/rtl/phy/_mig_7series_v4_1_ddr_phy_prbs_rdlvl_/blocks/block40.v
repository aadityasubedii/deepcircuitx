  always @(posedge clk)
    if (rst) begin
      prbs_dec_tap_calc_plus_3  <= #TCQ 'b0;
      prbs_dec_tap_calc_minus_3 <= #TCQ 'b0;
    end else if (new_cnt_dqs_r) begin
      prbs_dec_tap_calc_plus_3  <= #TCQ 'b000011;
      prbs_dec_tap_calc_minus_3 <= #TCQ 'b111100;
    end else begin
      prbs_dec_tap_calc_plus_3  <= #TCQ (prbs_dqs_tap_cnt_r  - rdlvl_cpt_tap_cnt + 3);
      prbs_dec_tap_calc_minus_3 <= #TCQ (prbs_dqs_tap_cnt_r  - rdlvl_cpt_tap_cnt - 3);
    end
