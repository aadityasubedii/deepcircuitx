  always @(posedge clk)
    if (rst || ~pi_fine_dly_dec_done_r || (delay_cnt_r == 6'd0))
     delay_cnt_r  <= #TCQ TDQSS_DLY;
    else if ( po_en_stg2_c && (delay_cnt_r > 6'd0))
      delay_cnt_r  <= #TCQ delay_cnt_r - 1;
