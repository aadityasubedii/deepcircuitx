  always @(*) begin
    for (d = 0; d < RANKS; d = d + 1) begin
      for (e = 0; e < DQS_WIDTH; e = e + 1) begin
        idelay_tap_cnt_w[(5*e+5*DQS_WIDTH*d)+:5] = idelay_tap_cnt_r[d][e];
        dbg_cpt_tap_cnt_w[(6*e+6*DQS_WIDTH*d)+:6] = rdlvl_dqs_tap_cnt_r[d][e];
      end
    end
  end