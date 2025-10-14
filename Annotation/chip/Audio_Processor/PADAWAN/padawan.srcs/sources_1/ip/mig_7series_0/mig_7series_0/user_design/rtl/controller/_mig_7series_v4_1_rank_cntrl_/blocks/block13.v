      always @(posedge clk) refresh_bank_r <= #TCQ refresh_bank_ns;

   `ifdef MC_SVA
      refresh_bank_overflow: assert property (@(posedge clk)
               (rst || (refresh_bank_r <= nREFRESH_BANK)));
      refresh_bank_underflow: assert property (@(posedge clk)
               (rst || ~(~|refresh_bank_r && ~my_refresh && refresh_tick)));
      refresh_hi_priority: cover property (@(posedge clk)
               (rst && ~|refresh_bank_ns && (refresh_bank_r ==
                       ONE[0+:REFRESH_BANK_WIDTH])));
      refresh_bank_full: cover property (@(posedge clk)
               (rst && (refresh_bank_r ==
                        nREFRESH_BANK[0+:REFRESH_BANK_WIDTH])));
   `endif

      assign refresh_request = init_calib_complete &&
              (~|refresh_bank_r ||
  ((refresh_bank_r != nREFRESH_BANK[0+:REFRESH_BANK_WIDTH]) && ~my_rank_busy));

    end