          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= MaxValue;
          IODRPCTRLR_R_WB         <= READ_MODE;
          Max_Value_Previous      <= Max_Value;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= READ_MAX_VALUE;
          else
            STATE <= WAIT10;