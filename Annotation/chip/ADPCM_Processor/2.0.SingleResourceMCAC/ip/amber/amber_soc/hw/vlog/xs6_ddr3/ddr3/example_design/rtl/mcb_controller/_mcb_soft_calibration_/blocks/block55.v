        WAIT1:  begin   
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT1;
          else
            STATE <= LOAD_RZQ_PTERM;