   always @(posedge clk) begin
     if (rst || (delaydec_cnt_r == 'd0))
       po_cnt_dec      <= #TCQ 1'b0;
     else if (cmd_delay_start && (delaydec_cnt_r > 'd0) && (wait_cnt_r == 'd1))
       po_cnt_dec      <= #TCQ 1'b1;
     else
       po_cnt_dec      <= #TCQ 1'b0;
   end