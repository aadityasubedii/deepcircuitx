        LDQS_CLK_N_TERM_WAIT:  begin   
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_CLK_N_TERM_WAIT;
          else begin
            STATE           <= LDQS_PIN_WRITE_P_TERM;
          end
        end
         LDQS_PIN_WRITE_P_TERM:  begin 