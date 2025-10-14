        WAIT2:  begin   
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT2;
          else if ((RZQ_IN)||(P_Term == 6'b111111)) begin
            STATE <= MULTIPLY_DIVIDE;
          end
          else
            STATE <= INC_PTERM;