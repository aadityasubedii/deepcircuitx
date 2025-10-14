   always @(posedge clk) begin
     if (rst)
       po_dec_done <= #TCQ 1'b0;
     else if (((po_cnt_dec == 'd1) && (po_rdval_cnt == 'd1)) || 
              (phy_ctl_ready_r6 && (po_rdval_cnt == 'd0))) begin
       po_dec_done <= #TCQ 1'b1;
     end
   end