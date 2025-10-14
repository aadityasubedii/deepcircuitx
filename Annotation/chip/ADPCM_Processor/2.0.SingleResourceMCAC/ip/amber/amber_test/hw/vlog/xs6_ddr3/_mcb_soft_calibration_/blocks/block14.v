            STATE <= UDQS_WAIT1;
        end
        UDQS_WAIT1:  begin           
          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_WAIT1;
          else begin
            STATE           <= UDQS_WRITE_NEG_INDELAY;
          end
        end