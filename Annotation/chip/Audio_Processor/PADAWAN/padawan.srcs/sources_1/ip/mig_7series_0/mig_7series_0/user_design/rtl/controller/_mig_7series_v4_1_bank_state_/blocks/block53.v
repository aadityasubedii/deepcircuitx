      assign start_pre_wait = op_exit_grant ||
                              (end_rtp_lcl && ~tail_r && ~passing_open_bank);