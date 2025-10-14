          LDQS_CLK_WRITE_P_TERM:  begin   
          IODRPCTRLR_MEMCELL_ADDR <= PTerm;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= {2'b00, P_Term_w};
          MCB_UIADDR              <= IOI_LDQS_CLK;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= LDQS_CLK_WRITE_P_TERM;
          else
            STATE <= LDQS_CLK_P_TERM_WAIT;