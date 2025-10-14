      always @(*)
        idel_pat_data_match <= #TCQ idel_pat0_data_match_r |
                                    idel_pat1_data_match_r;
