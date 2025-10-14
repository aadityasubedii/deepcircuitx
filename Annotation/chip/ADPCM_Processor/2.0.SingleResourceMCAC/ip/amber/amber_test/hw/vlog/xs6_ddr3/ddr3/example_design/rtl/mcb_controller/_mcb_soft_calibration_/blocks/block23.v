        OFF_ZIO_NTERM:  begin     
          Active_IODRP            <= ZIO;
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;
          IODRPCTRLR_WRITE_DATA   <= 8'b00;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= OFF_ZIO_NTERM;
          else
            STATE <= WAIT8;
        end
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