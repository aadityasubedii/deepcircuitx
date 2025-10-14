          IODRPCTRLR_WRITE_DATA   <= {1'b0, N_Term_s};
          MCB_UIADDR              <= IOI_UDQS_CLK;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= UDQS_CLK_WRITE_N_TERM;
          else
            STATE <= UDQS_CLK_N_TERM_WAIT;
        end