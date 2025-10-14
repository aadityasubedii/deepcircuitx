   always @(posedge clk) begin
     if (rst || po_cnt_dec || po_cnt_inc)
       wait_cnt_r <= #TCQ 'd8;
     else if (cmd_delay_start && (wait_cnt_r > 'd0))
       wait_cnt_r <= #TCQ wait_cnt_r - 1;
   end