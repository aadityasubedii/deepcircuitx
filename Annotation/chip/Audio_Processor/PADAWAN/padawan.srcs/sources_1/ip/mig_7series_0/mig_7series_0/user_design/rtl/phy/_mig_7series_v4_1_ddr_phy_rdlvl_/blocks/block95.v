     always @(posedge clk) begin
     if (rst) begin
       pi_rdval_cnt    <= #TCQ 'd0;
     end else if (dqs_po_dec_done_r1 && ~dqs_po_dec_done_r2) begin
       pi_rdval_cnt    <= #TCQ pi_counter_read_val;
     end else if (pi_rdval_cnt > 'd0) begin
       if (pi_cnt_dec)
         pi_rdval_cnt  <= #TCQ pi_rdval_cnt - 1;
       else
         pi_rdval_cnt  <= #TCQ pi_rdval_cnt;
     end else if (pi_rdval_cnt == 'd0) begin
       pi_rdval_cnt    <= #TCQ pi_rdval_cnt;
     end
   end