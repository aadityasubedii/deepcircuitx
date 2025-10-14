     always @(posedge clk) begin
       if (rst || pi_cnt_dec)
         wait_cnt_r <= #TCQ 'd8;
       else if (dqs_po_dec_done_r2 && (wait_cnt_r > 'd0))
         wait_cnt_r <= #TCQ wait_cnt_r - 1;
     end