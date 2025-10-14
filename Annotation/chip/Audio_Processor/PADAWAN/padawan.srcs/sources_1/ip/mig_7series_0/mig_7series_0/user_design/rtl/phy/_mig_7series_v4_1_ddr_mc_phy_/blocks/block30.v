   if ( HIGHEST_BANK > 0) begin
       assign phy_din[HIGHEST_LANE_B0*80-1:0] = 0;
       assign _phy_ctl_a_full_p[0] = 0;
       assign of_ctl_a_full_v[0]   = 0;
       assign of_ctl_full_v[0]     = 0;
       assign of_data_a_full_v[0]  = 0;
       assign of_data_full_v[0]    = 0;
       assign pre_data_a_full_v[0] = 0;
       assign if_empty_v[0]        = 0;
       assign byte_rd_en_v[0]      = 1;