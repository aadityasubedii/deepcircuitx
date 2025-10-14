        BROADCAST_NTERM:  begin    
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;
          IODRPCTRLR_WRITE_DATA   <= {2'b00,N_Term};
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          MCB_CMD_VALID           <= 1'b1;
          MCB_USE_BKST            <= 1'b1;
          MCB_UIDRPUPDATE         <= ~First_In_Term_Done; 
          if (MCB_RDY_BUSY_N)
            STATE <= BROADCAST_NTERM;
          else
            STATE <= WAIT6;