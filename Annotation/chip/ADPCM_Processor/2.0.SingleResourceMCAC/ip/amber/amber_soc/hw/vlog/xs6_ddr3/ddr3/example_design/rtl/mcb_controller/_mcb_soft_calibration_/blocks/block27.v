        OFF_RZQ_PTERM:  begin        
          Active_IODRP            <= RZQ;
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= PTerm;
          IODRPCTRLR_WRITE_DATA   <= 8'b00;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          P_Term                  <= 6'b0;
          N_Term                  <= 5'b0;
          MCB_UIDRPUPDATE         <= ~First_In_Term_Done; 
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= OFF_RZQ_PTERM;
          else
            STATE <= WAIT7;