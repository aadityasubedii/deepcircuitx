          IODRPCTRLR_WRITE_DATA   <= {2'b00, P_Term_s};
          MCB_UIADDR              <= IOI_UDQS_PIN;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= UDQS_PIN_WRITE_P_TERM;
          else
            STATE <= UDQS_PIN_P_TERM_WAIT;
        end
        UDQS_PIN_P_TERM_WAIT:  begin  
          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_PIN_P_TERM_WAIT;
          else begin
            STATE           <= UDQS_PIN_WRITE_N_TERM;