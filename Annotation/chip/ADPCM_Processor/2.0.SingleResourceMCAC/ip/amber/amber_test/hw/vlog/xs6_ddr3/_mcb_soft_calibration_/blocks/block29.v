          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_CLK_P_TERM_WAIT;
          else begin
            STATE           <= UDQS_CLK_WRITE_N_TERM;
          end
        end
        UDQS_CLK_WRITE_N_TERM:  begin 
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;