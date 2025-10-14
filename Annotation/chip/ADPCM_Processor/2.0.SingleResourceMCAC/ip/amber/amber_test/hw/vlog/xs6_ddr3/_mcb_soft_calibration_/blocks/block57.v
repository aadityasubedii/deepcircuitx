    else begin
      counter_en              <= 1'b0;
      IODRPCTRLR_CMD_VALID    <= 1'b0;
      IODRPCTRLR_MEMCELL_ADDR <= NoOp;
      IODRPCTRLR_R_WB         <= READ_MODE;
      IODRPCTRLR_USE_BKST     <= 1'b0;