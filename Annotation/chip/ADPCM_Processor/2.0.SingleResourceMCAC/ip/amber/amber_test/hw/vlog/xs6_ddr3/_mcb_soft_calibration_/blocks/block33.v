        LDQS_PIN_P_TERM_WAIT:  begin   
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_PIN_P_TERM_WAIT;
          else begin
            STATE           <= LDQS_PIN_WRITE_N_TERM;
          end
        end