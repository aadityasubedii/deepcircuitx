   if ( HIGHEST_BANK > 1)  begin
       assign phy_din[HIGHEST_LANE_B1*80+320-1:320] = 0;
       assign _phy_ctl_a_full_p[1] = 0;
       assign of_ctl_a_full_v[1]   = 0;
       assign of_ctl_full_v[1]     = 0;
       assign of_data_a_full_v[1]  = 0;
       assign of_data_full_v[1]    = 0;
       assign pre_data_a_full_v[1] = 0;
       assign if_empty_v[1]        = 0;
       assign byte_rd_en_v[1]      = 1;
       assign pi_phase_locked_lanes[HIGHEST_LANE_B1+4-1:4]  = 4'b1111;
       assign pi_dqs_found_lanes[HIGHEST_LANE_B1+4-1:4]  = 4'b1111;