        UDQS_WAIT2:  begin           
          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_WAIT2;
          else begin
            DQS_DELAY         <= DQS_DELAY_INITIAL;
            TARGET_DQS_DELAY  <= DQS_DELAY_INITIAL;
            STATE             <= START_DYN_CAL;
          end
        end