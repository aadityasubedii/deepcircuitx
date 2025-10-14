
        START_DYN_CAL:  begin       
          Pre_SYSRST        <= 1'b0;      
          counter_inc       <= 8'b0;
          counter_dec       <= 8'b0;
          if (SKIP_DYNAMIC_DQS_CAL & SKIP_DYN_IN_TERMINATION)
            STATE <= DONE;  
          else
          if (IODRPCTRLR_RDY_BUSY_N && MCB_UODONECAL && ~SELFREFRESH_REQ_R1 ) begin  

            
            if (~SKIP_DYN_IN_TERMINATION & (LastPass_DynCal == `DYN_CAL_PASS)) begin
              LastPass_DynCal <= `IN_TERM_PASS;
              STATE           <= LOAD_RZQ_NTERM;
            end