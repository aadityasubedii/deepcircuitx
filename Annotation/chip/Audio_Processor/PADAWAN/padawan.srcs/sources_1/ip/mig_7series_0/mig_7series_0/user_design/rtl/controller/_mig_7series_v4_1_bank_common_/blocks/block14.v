    always @(posedge clk) maint_srx_r1 <= #TCQ maint_srx_r;
    assign start_maint = maint_rdy && ~maint_rdy_r1 || maint_srx_r && ~maint_srx_r1;

    end 