  always @(posedge clk)
    if (rst || (init_state_r == INIT_RDLVL_STG2_READ_WAIT))
      num_reads <= #TCQ 3'b000;
    else if ((num_reads > 3'b000) && ~(phy_ctl_full || phy_cmd_full))
      num_reads <= #TCQ num_reads - 1;
    else if ((init_state_r == INIT_RDLVL_STG2_READ) || phy_ctl_full || 
             phy_cmd_full && new_burst_r)
      num_reads <= #TCQ 3'b111;
end