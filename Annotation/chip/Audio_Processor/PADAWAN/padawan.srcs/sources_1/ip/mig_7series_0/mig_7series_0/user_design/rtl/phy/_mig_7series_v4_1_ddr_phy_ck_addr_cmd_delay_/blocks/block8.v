   always @(posedge clk) begin
     if (rst || (delaydec_cnt_r > 6'd0) || (delay_cnt_r == 'd0) || (TAP_DEC == 0))
       po_cnt_inc      <= #TCQ 1'b0;
     else if ((delay_cnt_r > 'd0) && (wait_cnt_r == 'd1))
       po_cnt_inc      <= #TCQ 1'b1;
     else
       po_cnt_inc      <= #TCQ 1'b0;
   end