  always @(posedge clk)
    if(rst)
      maint_ref_zq_wip_r <= #TCQ 1'b0;
    else if((zq_request || |refresh_request) && insert_maint_r1)
      maint_ref_zq_wip_r <= #TCQ 1'b1;
    else if(~maint_wip_r)
      maint_ref_zq_wip_r <= #TCQ 1'b0;