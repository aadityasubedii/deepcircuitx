   always @(posedge clk) begin
     if (rst) begin
       po_rdval_cnt    <= #TCQ 'd0;
     end else if (phy_ctl_ready_r5 && ~phy_ctl_ready_r6) begin
       po_rdval_cnt    <= #TCQ po_counter_read_val;
     end else if (po_rdval_cnt > 'd0) begin
       if (po_cnt_dec)
         po_rdval_cnt  <= #TCQ po_rdval_cnt - 1;
       else            
         po_rdval_cnt  <= #TCQ po_rdval_cnt;
     end else if (po_rdval_cnt == 'd0) begin
       po_rdval_cnt    <= #TCQ po_rdval_cnt;
     end
   end