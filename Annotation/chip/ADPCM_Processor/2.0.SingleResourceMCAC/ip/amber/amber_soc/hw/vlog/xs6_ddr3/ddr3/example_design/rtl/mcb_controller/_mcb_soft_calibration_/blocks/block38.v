        LDQS_CLK_N_TERM_WAIT:  begin   
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_CLK_N_TERM_WAIT;
          else begin
            STATE           <= LDQS_PIN_WRITE_P_TERM;
          end
        end
         LDQS_PIN_WRITE_P_TERM:  begin 
          IODRPCTRLR_MEMCELL_ADDR <= PTerm;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= {2'b00, P_Term_s};
          MCB_UIADDR              <= IOI_LDQS_PIN;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= LDQS_PIN_WRITE_P_TERM;