  always @(posedge clk)
    if (rst)
      lane_cnt_dqs_c_r  <= #TCQ 'd0;
    else if ( po_en_stg2_c && (delay_cnt_r == 6'd1))
      lane_cnt_dqs_c_r  <= #TCQ lane_cnt_dqs_c_r + 1;
