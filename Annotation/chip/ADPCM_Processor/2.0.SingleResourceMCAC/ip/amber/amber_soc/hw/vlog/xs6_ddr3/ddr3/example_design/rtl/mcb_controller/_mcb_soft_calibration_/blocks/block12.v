            else begin
              LastPass_DynCal <= `DYN_CAL_PASS;
              STATE           <= WRITE_CALIBRATE;
            end
          end
          else
            STATE     <= START_DYN_CAL;