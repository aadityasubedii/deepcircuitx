      case (STATE)
        START:  begin   
          MCB_UICMDEN     <= 1'b1;        
          MCB_UIDONECAL   <= 1'b0;        
          P_Term          <= 6'b0;
          N_Term          <= 7'b0;
          Pre_SYSRST      <= 1'b1;        
          LastPass_DynCal <= `IN_TERM_PASS;
          if (SKIP_IN_TERM_CAL) begin
               STATE <= WAIT_FOR_START_BROADCAST;
               P_Term <= 'b0;
               N_Term <= 'b0;
            end
          else if (IODRPCTRLR_RDY_BUSY_N)
            STATE  <= LOAD_RZQ_NTERM;
          else
            STATE  <= START;
        end