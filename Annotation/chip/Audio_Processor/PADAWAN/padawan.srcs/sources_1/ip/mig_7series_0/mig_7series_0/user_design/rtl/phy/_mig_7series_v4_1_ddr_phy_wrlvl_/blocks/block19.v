       for(i = 0; i < DQS_WIDTH; i = i +1) begin: smallest_dqs
         smallest[i] <= #TCQ wl_dqs_tap_count_r[0][i];
         largest[i]  <= #TCQ wl_dqs_tap_count_r[0][i];
       end