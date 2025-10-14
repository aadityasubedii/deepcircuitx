   always @(posedge clk) begin
     if (rst || (po_rdval_cnt == 'd0))
       po_cnt_dec      <= #TCQ 1'b0;
     else if (phy_ctl_ready_r6 && (po_rdval_cnt > 'd0) && (wait_cnt == 'd1))
       po_cnt_dec      <= #TCQ 1'b1;
     else
       po_cnt_dec      <= #TCQ 1'b0;
     end