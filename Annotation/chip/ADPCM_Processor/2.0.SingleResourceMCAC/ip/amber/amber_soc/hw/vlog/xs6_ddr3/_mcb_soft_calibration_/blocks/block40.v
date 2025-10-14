        LOAD_ZIO_NTERM: begin   
          Active_IODRP            <= ZIO;
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;
          IODRPCTRLR_WRITE_DATA   <= {1'b0,N_Term};
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= LOAD_ZIO_NTERM;
          else
            STATE <= WAIT4;