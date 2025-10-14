        WAIT6:  begin             
          if (!MCB_RDY_BUSY_N)
            STATE <= WAIT6;
          else if (First_In_Term_Done) begin  