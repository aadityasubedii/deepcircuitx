        WAIT4:  begin   
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT4;
          else if ((!ZIO_IN)||(N_Term == 7'b1111111)) begin
            if (PNSKEW) begin
              STATE    <= SKEW;
            end
            else 
            STATE <= WAIT_FOR_START_BROADCAST;
          end
          else
            STATE <= INC_NTERM;
        end