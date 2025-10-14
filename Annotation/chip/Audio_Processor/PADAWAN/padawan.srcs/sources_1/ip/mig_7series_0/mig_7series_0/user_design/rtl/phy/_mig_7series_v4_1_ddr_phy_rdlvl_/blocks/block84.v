   always @(posedge clk) begin
     if (rst || (done_cnt == 4'd0) ||
         (mpr_rdlvl_done_r1 && ~mpr_rdlvl_done_r2))
       regl_dqs_cnt    <= #TCQ {DQS_CNT_WIDTH+1{1'b0}};
     else if ((cal1_state_r == CAL1_REGL_LOAD) &&
              (regl_dqs_cnt == DQS_WIDTH-1) && (done_cnt == 4'd1)) begin
       if (regl_rank_cnt == RANKS-1)
         regl_dqs_cnt  <= #TCQ regl_dqs_cnt;
       else
         regl_dqs_cnt  <= #TCQ 'b0;
     end else if ((cal1_state_r == CAL1_REGL_LOAD) && (regl_dqs_cnt != DQS_WIDTH-1)
                  && (done_cnt == 4'd1))
       regl_dqs_cnt  <= #TCQ regl_dqs_cnt + 1;
     else
       regl_dqs_cnt  <= #TCQ regl_dqs_cnt;
   end