        LDQS_WAIT1:  begin           
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_WAIT1;
          else begin
            STATE           <= LDQS_WRITE_NEG_INDELAY;