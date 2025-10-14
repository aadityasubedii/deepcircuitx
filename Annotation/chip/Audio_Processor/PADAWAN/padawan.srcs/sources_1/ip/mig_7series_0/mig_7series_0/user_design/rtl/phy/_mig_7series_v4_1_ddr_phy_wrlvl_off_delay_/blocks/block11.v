  always @(posedge clk)
    if (rst)
      lane_cnt_po_r  <= #TCQ 'd0;
    else if ( po_en_stg2_f  && (po_delay_cnt_r == 6'd1))
      lane_cnt_po_r  <= #TCQ lane_cnt_po_r + 1;