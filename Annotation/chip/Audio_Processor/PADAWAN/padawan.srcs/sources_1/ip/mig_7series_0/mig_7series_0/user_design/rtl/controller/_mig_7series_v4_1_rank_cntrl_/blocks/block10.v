  generate begin : periodic_rd_generation
    if ( PERIODIC_RD_TIMER_DIV != 0 ) begin  
      reg read_this_rank;