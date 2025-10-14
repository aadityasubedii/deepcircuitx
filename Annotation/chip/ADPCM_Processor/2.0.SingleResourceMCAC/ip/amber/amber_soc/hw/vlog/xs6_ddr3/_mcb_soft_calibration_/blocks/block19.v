          end
        end
         UDQS_PIN_WRITE_N_TERM:  begin  
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= {1'b0, N_Term_w};
          MCB_UIADDR              <= IOI_UDQS_PIN;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= UDQS_PIN_WRITE_N_TERM;
          else
            STATE <= UDQS_PIN_N_TERM_WAIT;
        end
        UDQS_PIN_N_TERM_WAIT:  begin   