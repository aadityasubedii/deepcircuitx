   always @(posedge clk) begin
     if (rst) begin
       fine_dly_dec_done_r1 <= #TCQ 1'b0;
     end else if (((pi_cnt_dec == 'd1) && (pi_rdval_cnt == 'd1)) ||
                  (dqs_po_dec_done_r2 && (pi_rdval_cnt == 'd0))) begin
       fine_dly_dec_done_r1 <= #TCQ 1'b1;
     end
   end