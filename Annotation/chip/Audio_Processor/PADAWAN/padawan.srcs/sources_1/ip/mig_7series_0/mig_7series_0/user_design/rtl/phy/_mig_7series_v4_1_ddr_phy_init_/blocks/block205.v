  always @(posedge clk)
    if (rst)
      mpr_rdlvl_start <= #TCQ 1'b0;
    else if (pi_dqs_found_done &&
           (init_state_r == INIT_MPR_READ))
      mpr_rdlvl_start <= #TCQ 1'b1;
