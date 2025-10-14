          if (MCB_RDY_BUSY_N)
            STATE <= UDQS_CLK_WRITE_P_TERM;
          else
            STATE <= UDQS_CLK_P_TERM_WAIT;
        end
        UDQS_CLK_P_TERM_WAIT:  begin 
          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_CLK_P_TERM_WAIT;
          else begin
            STATE           <= UDQS_CLK_WRITE_N_TERM;
          end
        end