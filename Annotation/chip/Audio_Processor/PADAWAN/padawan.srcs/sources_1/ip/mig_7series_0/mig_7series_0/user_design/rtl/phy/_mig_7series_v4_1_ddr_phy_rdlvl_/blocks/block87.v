   always @(posedge clk) begin
     if (rst || (done_cnt == 4'd0)) begin
       pi_stg2_load_timing    <= #TCQ 'b0;
       pi_stg2_reg_l_timing   <= #TCQ 'b0;
     end else if ((cal1_state_r == CAL1_REGL_LOAD) &&
                  (regl_dqs_cnt <= DQS_WIDTH-1) && (done_cnt == 4'd1)) begin
       pi_stg2_load_timing  <= #TCQ 'b1;
       pi_stg2_reg_l_timing <= #TCQ
         rdlvl_dqs_tap_cnt_r[rnk_cnt_r][regl_dqs_cnt];
     end else begin
       pi_stg2_load_timing  <= #TCQ 'b0;
       pi_stg2_reg_l_timing <= #TCQ 'b0;
     end
   end