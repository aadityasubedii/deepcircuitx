        WAIT7:  begin             
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT7;
          else
            STATE <= OFF_ZIO_NTERM;