          MCB_UIADDR              <= IOI_UDQS_CLK;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= UDQS_CLK_WRITE_P_TERM;
          else
            STATE <= UDQS_CLK_P_TERM_WAIT;
        end