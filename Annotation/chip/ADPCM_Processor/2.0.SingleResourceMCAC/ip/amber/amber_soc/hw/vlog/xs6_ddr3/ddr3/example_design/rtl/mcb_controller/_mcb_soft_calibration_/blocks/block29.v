        UDQS_PIN_P_TERM_WAIT:  begin  
          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_PIN_P_TERM_WAIT;
          else begin
            STATE           <= UDQS_PIN_WRITE_N_TERM;
          end