   always @ (posedge clk_i) begin
    if (rst_i[0])
         force_wrcmd_gen <= #TCQ 1'b0;
    else if ((wait_bl_end == 1'b0 &&  wait_bl_end_r1 == 1'b1) || force_wrcmd_timeout_cnts == 8'b11111111)
         force_wrcmd_gen <= #TCQ 1'b0;
   
    else if ((cmd_valid_i && bl_i > 16) || wait_bl_end )
         force_wrcmd_gen <= #TCQ 1'b1;
    end