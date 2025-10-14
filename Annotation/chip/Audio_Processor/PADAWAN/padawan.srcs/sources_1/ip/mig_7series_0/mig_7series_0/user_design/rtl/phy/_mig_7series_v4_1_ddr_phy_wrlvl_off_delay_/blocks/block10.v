  always @(posedge clk)
    if (rst || ~cmd_delay_start_r6 )
      po_delay_done    <= #TCQ 1'b0;
    else if ((po_delay_cnt_r == 6'd1) && (lane_cnt_po_r ==1'b0))
      po_delay_done    <= #TCQ 1'b1;
