        WAIT5:  begin   
          if (!MCB_RDY_BUSY_N)
            STATE <= WAIT5;
          else if (First_In_Term_Done) begin  
            if (MCB_UOREFRSHFLAG) begin
              MCB_UIDRPUPDATE <= 1'b1;
              if (N_Term != N_Term_Prev) begin
                N_Term_Prev <= N_Term;
                STATE       <= BROADCAST_NTERM;
              end
              else
                STATE <= OFF_RZQ_PTERM;
            end
            else
              STATE <= WAIT5;   
          end