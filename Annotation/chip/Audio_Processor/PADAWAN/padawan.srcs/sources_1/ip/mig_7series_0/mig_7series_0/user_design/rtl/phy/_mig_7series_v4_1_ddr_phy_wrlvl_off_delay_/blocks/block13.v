  always @(posedge clk)
    if (rst || ~cmd_delay_start_r6 || po_delay_done) begin
      po_stg2_f_incdec  <= #TCQ 1'b0;
      po_en_stg2_f    <= #TCQ 1'b0;
    end else if (po_delay_cnt_r > 6'd0) begin
      po_en_stg2_f    <= #TCQ ~po_en_stg2_f;
    end