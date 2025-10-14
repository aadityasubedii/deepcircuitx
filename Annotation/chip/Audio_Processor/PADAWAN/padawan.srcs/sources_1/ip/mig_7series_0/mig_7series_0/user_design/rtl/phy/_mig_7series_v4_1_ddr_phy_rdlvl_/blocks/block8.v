  always @(posedge clk)
    if (rst || new_cnt_cpt_r ||
        (mpr_rdlvl_done_r1 && ~mpr_rdlvl_done_r2))
      tap_cnt_cpt_r   <= #TCQ 'b0;
    else if (cal1_dlyce_cpt_r) begin
      if (cal1_dlyinc_cpt_r)
        tap_cnt_cpt_r <= #TCQ tap_cnt_cpt_r + 1;
      else if (tap_cnt_cpt_r != 'd0)
        tap_cnt_cpt_r <= #TCQ tap_cnt_cpt_r - 1;
    end
