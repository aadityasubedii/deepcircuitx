        WAIT3:  begin   
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT3;
          else begin
            STATE   <= LOAD_ZIO_NTERM;
          end
        end