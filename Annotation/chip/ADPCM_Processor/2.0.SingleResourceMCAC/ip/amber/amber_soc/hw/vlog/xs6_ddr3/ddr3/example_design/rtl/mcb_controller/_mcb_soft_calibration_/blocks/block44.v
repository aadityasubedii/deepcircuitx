          IODRPCTRLR_R_WB         <= WRITE_MODE;
          MCB_CMD_VALID           <= 1'b1;
          MCB_UIDRPUPDATE         <= ~First_In_Term_Done; 
          MCB_USE_BKST            <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= BROADCAST_PTERM;
          else
            STATE <= WAIT5;