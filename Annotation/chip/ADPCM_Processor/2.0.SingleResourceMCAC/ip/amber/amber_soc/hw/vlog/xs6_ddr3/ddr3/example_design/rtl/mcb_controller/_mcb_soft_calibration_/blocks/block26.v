        OFF_ZIO_NTERM:  begin     
          Active_IODRP            <= ZIO;
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;
          IODRPCTRLR_WRITE_DATA   <= 8'b00;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= OFF_ZIO_NTERM;
          else
            STATE <= WAIT8;