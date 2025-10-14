            if (MCB_UOREFRSHFLAG) begin
              MCB_UIDRPUPDATE <= 1'b1;
              STATE           <= OFF_RZQ_PTERM;
            end
            else
              STATE <= WAIT6;   
          end
          else
               STATE <= LDQS_CLK_WRITE_P_TERM;
        end