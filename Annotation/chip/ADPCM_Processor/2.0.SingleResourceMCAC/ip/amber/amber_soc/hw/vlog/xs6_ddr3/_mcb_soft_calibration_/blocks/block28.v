          IODRPCTRLR_WRITE_DATA   <= {1'b0, N_Term_s};
          MCB_UIADDR              <= IOI_LDQS_CLK;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= LDQS_CLK_WRITE_N_TERM;
          else
            STATE <= LDQS_CLK_N_TERM_WAIT;
        end
        LDQS_CLK_N_TERM_WAIT:  begin   
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_CLK_N_TERM_WAIT;