            else begin
              LastPass_DynCal <= `DYN_CAL_PASS;
              STATE           <= WRITE_CALIBRATE;
            end
          end
          else
            STATE     <= START_DYN_CAL;
        end
        WRITE_CALIBRATE:  begin   
          Pre_SYSRST              <= 1'b0; 
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= DelayControl;
          IODRPCTRLR_WRITE_DATA   <= 8'h20; 
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          Active_IODRP            <= RZQ;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= WRITE_CALIBRATE;
          else
            STATE <= WAIT9;