        WAIT8:  begin             
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT8;
          else begin
            if (First_In_Term_Done) begin
              STATE               <= START_DYN_CAL; 
            end
            else begin
              STATE               <= WRITE_CALIBRATE; 
            end
          end
        end