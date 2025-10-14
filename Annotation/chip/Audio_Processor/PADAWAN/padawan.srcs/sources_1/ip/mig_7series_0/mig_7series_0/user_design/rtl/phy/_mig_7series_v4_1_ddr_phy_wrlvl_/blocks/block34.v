   always @(posedge clk) begin
     if (rst || po_cnt_dec)
       wait_cnt <= #TCQ 'd8;
     else if (phy_ctl_ready_r6 && (wait_cnt > 'd0))
       wait_cnt <= #TCQ wait_cnt - 1;
   end