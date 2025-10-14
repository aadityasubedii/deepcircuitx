      assign refresh_request = init_calib_complete &&
              (~|refresh_bank_r ||
  ((refresh_bank_r != nREFRESH_BANK[0+:REFRESH_BANK_WIDTH]) && ~my_rank_busy));