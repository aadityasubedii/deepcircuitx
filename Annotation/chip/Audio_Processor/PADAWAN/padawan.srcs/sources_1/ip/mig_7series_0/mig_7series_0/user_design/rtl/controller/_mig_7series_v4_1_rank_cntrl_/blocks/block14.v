      always @(app_ref_req or init_calib_complete or my_refresh
               or refresh_bank_r or refresh_tick)
        if (~init_calib_complete)
          if (REFRESH_TIMER_DIV == 0)
                refresh_bank_ns = nREFRESH_BANK[0+:REFRESH_BANK_WIDTH];
          else refresh_bank_ns = {REFRESH_BANK_WIDTH{1'b0}};
        else
          case ({my_refresh, refresh_tick, app_ref_req})
            3'b000, 3'b110, 3'b101, 3'b111 : refresh_bank_ns = refresh_bank_r;
            3'b010, 3'b001, 3'b011 : refresh_bank_ns =
                                          (|refresh_bank_r)?
                                          refresh_bank_r - ONE[0+:REFRESH_BANK_WIDTH]:
                                          refresh_bank_r;
            3'b100                 : refresh_bank_ns =
                                   refresh_bank_r + ONE[0+:REFRESH_BANK_WIDTH];
          endcase 