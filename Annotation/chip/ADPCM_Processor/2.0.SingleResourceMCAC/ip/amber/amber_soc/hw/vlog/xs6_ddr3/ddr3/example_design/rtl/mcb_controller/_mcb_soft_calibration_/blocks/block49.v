        WAIT4:  begin   
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT4;