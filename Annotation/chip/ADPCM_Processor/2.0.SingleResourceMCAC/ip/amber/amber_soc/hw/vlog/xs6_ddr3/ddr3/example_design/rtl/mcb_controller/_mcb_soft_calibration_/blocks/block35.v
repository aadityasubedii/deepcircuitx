          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_PIN_N_TERM_WAIT;
          else begin
            STATE           <= UDQS_CLK_WRITE_P_TERM;
          end