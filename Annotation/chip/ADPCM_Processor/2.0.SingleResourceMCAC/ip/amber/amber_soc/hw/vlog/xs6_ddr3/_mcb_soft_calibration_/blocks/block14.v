        START_DYN_CAL_PRE:  begin   
          LastPass_DynCal <= `IN_TERM_PASS;
          MCB_UICMDEN     <= 1'b0;    
          MCB_UIDONECAL   <= 1'b1;    
          Pre_SYSRST      <= 1'b1;    
          if (~CALMODE_EQ_CALIBRATION)      
            STATE       <= START_DYN_CAL;  
          else if (pre_sysrst_minpulse_width_ok)   
            STATE       <= WAIT_FOR_UODONE;
          end
        WAIT_FOR_UODONE:  begin  