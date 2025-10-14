  generate
    
    if ( PERIODIC_RD_TIMER_DIV != 0 ) begin : periodic_read_request


      reg periodic_rd_r_cnt;
      wire int_periodic_rd_ack_r = (periodic_rd_ack_r && periodic_rd_r_cnt);
      reg upd_last_master_r;
      wire periodic_rd_busy = upd_last_master_r || periodic_rd_r_lcl;
      wire upd_last_master_ns =
             init_calib_complete && (|periodic_rd_request && ~periodic_rd_busy);