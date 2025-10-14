          MCB_UIADDR              <= IOI_LDQS_PIN;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= LDQS_PIN_WRITE_P_TERM;
          else
            STATE <= LDQS_PIN_P_TERM_WAIT;
        end
        LDQS_PIN_P_TERM_WAIT:  begin   
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_PIN_P_TERM_WAIT;
          else begin
            STATE           <= LDQS_PIN_WRITE_N_TERM;
          end
        end