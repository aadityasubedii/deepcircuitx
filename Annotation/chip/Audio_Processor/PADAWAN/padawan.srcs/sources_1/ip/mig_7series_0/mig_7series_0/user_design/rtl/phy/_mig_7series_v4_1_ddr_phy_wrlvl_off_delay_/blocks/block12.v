  always @(posedge clk)
    if (rst || ~cmd_delay_start_r6 || (po_delay_cnt_r == 6'd0))
      
      
      po_delay_cnt_r  <= #TCQ (PO_INITIAL_DLY - 31);
    else if ( po_en_stg2_f && (po_delay_cnt_r > 6'd0))
      po_delay_cnt_r  <= #TCQ po_delay_cnt_r - 1;