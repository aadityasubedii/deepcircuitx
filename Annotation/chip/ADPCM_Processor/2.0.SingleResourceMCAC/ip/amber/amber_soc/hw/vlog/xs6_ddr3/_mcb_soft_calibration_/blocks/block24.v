            STATE <= LDQS_PIN_N_TERM_WAIT;
          else begin
            STATE           <= UDQS_CLK_WRITE_P_TERM;
          end
        end
        UDQS_CLK_WRITE_P_TERM:  begin 
          IODRPCTRLR_MEMCELL_ADDR <= PTerm;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= {2'b00, P_Term_w};