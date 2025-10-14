        LOAD_RZQ_PTERM: begin 
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= PTerm;
          IODRPCTRLR_WRITE_DATA   <= {2'b00,P_Term};
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= LOAD_RZQ_PTERM;
          else
            STATE <= WAIT2;
        end