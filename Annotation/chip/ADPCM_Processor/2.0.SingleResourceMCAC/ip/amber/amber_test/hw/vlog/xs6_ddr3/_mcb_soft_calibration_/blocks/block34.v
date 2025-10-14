          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= {2'b00, P_Term_s};
          MCB_UIADDR              <= IOI_LDQS_PIN;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= LDQS_PIN_WRITE_P_TERM;
          else
            STATE <= LDQS_PIN_P_TERM_WAIT;