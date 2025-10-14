   always @(posedge clk) begin
     if (rst || (pi_rdval_cnt == 'd0))
       pi_cnt_dec      <= #TCQ 1'b0;
     else if (dqs_po_dec_done_r2 && (pi_rdval_cnt > 'd0)
                  && (wait_cnt_r == 'd1))
       pi_cnt_dec      <= #TCQ 1'b1;
     else
       pi_cnt_dec      <= #TCQ 1'b0;
   end