
        START_DYN_CAL:  begin       
          Pre_SYSRST        <= 1'b0;      
          counter_inc       <= 8'b0;
          counter_dec       <= 8'b0;
          if (SKIP_DYNAMIC_DQS_CAL & SKIP_DYN_IN_TERMINATION)
            STATE <= DONE;  