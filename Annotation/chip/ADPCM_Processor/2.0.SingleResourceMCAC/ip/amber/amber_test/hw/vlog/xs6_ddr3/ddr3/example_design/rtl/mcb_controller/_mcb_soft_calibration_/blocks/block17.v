        end
        LDQS_WAIT2:  begin           
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_WAIT2;
          else begin
            STATE <= UDQS_WRITE_POS_INDELAY;
          end
        end