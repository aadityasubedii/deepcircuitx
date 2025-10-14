          if (IODRPCTRLR_RDY_BUSY_N && MCB_UODONECAL && ~SELFREFRESH_REQ_R1 ) begin  

            
            if (~SKIP_DYN_IN_TERMINATION & (LastPass_DynCal == `DYN_CAL_PASS)) begin
              LastPass_DynCal <= `IN_TERM_PASS;
              STATE           <= LOAD_RZQ_NTERM;
            end