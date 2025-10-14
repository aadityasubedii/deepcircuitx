            if (PNSKEW) begin
              STATE    <= SKEW;
            end
            else 
            STATE <= WAIT_FOR_START_BROADCAST;