        UDQS_CLK_N_TERM_WAIT:  begin 
          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_CLK_N_TERM_WAIT;
          else begin
            STATE           <= UDQS_PIN_WRITE_P_TERM;
          end
        end
         UDQS_PIN_WRITE_P_TERM:  begin 