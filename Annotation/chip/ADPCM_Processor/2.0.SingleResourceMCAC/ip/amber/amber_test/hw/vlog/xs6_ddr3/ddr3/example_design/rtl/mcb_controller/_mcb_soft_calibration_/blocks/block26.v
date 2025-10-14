            STATE <= UDQS_PIN_WRITE_N_TERM;
          else
            STATE <= UDQS_PIN_N_TERM_WAIT;
        end
        UDQS_PIN_N_TERM_WAIT:  begin   
          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_PIN_N_TERM_WAIT;
          else begin
            STATE           <= OFF_RZQ_PTERM;
          end
        end
        OFF_RZQ_PTERM:  begin        
          Active_IODRP            <= RZQ;