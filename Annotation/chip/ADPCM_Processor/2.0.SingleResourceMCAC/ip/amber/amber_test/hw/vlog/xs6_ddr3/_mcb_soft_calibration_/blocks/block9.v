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
        end
        WAIT9:  begin     
          counter_en  <= 1'b1;
          if (count < 6'd38)  
            STATE     <= WAIT9;
          else
            STATE     <= READ_MAX_VALUE;
        end