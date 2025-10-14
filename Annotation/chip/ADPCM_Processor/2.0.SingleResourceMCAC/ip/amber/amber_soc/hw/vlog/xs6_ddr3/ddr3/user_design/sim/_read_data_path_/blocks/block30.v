   always @ (posedge clk_i) begin
    if (rst_i[0])
        force_wrcmd_timeout_cnts <= #TCQ 'b0;
    else if (wait_bl_end == 1'b0 &&  wait_bl_end_r1 == 1'b1)
        force_wrcmd_timeout_cnts <= #TCQ 'b0;
        
    else if (force_wrcmd_gen)
        force_wrcmd_timeout_cnts <= #TCQ force_wrcmd_timeout_cnts + 1;
   end