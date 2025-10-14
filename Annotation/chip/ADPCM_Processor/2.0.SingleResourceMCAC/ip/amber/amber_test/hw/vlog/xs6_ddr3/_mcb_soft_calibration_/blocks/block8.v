        READ_MAX_VALUE: begin     
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= MaxValue;
          IODRPCTRLR_R_WB         <= READ_MODE;
          Max_Value_Previous      <= Max_Value;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= READ_MAX_VALUE;
          else
            STATE <= WAIT10;
        end
        WAIT10:  begin    
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT10;
          else begin
            Max_Value           <= IODRPCTRLR_READ_DATA;  
            if (~First_In_Term_Done) begin
              STATE               <= RST_DELAY;
              First_In_Term_Done  <= 1'b1;
            end
            else
              STATE               <= ANALYZE_MAX_VALUE;