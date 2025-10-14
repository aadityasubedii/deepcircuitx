        WAIT6:  begin             
          if (!MCB_RDY_BUSY_N)
            STATE <= WAIT6;
          else if (First_In_Term_Done) begin  
            if (MCB_UOREFRSHFLAG) begin
              MCB_UIDRPUPDATE <= 1'b1;
              STATE           <= OFF_RZQ_PTERM;
            end
            else
              STATE <= WAIT6;   
          end
          else