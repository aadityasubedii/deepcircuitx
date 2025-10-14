        WAIT_FOR_START_BROADCAST: begin   
          Pre_SYSRST    <= 1'b0;      
          Active_IODRP  <= MCB_PORT;
          if (START_BROADCAST && IODRPCTRLR_RDY_BUSY_N) begin
            if (P_Term != P_Term_Prev || SKIP_IN_TERM_CAL   ) begin
              STATE       <= BROADCAST_PTERM;
              P_Term_Prev <= P_Term;
            end
            else if (N_Term != N_Term_Prev) begin
              N_Term_Prev <= N_Term;
              STATE       <= BROADCAST_NTERM;
            end
            else
              STATE <= OFF_RZQ_PTERM;
          end
          else
            STATE   <= WAIT_FOR_START_BROADCAST;
        end