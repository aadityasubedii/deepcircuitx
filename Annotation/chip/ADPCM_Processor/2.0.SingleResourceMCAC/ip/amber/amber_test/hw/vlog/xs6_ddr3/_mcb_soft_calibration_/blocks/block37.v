        LDQS_CLK_P_TERM_WAIT:  begin     
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_CLK_P_TERM_WAIT;
          else begin
            STATE           <= LDQS_CLK_WRITE_N_TERM;
          end