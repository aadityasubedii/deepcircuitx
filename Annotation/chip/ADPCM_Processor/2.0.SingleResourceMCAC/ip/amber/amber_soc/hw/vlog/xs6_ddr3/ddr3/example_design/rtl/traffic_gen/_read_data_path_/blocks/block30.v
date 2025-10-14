   always @ (posedge clk_i)
    if (rst_i[0])
         wait_bl_end <= #TCQ 1'b0;
    else if (force_wrcmd_timeout_cnts == 8'b11111111)
         wait_bl_end <= #TCQ 1'b0;
    
    else if (gen_rdy && gen_valid && gen_bl > 16)
         wait_bl_end <= #TCQ 1'b1;
    else if (wait_bl_end && user_bl_cnt_is_1)
         wait_bl_end <= #TCQ 1'b0;
   