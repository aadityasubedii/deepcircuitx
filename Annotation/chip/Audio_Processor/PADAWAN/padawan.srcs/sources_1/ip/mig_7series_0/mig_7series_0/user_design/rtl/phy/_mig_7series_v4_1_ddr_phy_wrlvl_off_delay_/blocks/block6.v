  always @(posedge clk)
    if (rst || ~pi_fine_dly_dec_done_r || delay_done) begin
      po_stg2_incdec_c   <= #TCQ 1'b1;
      po_en_stg2_c    <= #TCQ 1'b0;
    end else if (delay_cnt_r > 6'd0) begin
      po_en_stg2_c    <= #TCQ ~po_en_stg2_c;
    end