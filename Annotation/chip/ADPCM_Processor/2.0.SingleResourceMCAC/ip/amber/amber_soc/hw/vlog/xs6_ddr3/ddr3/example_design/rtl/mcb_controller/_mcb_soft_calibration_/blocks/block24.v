          if (Block_Reset) begin  
            STATE       <= RST_DELAY;
          end			 
          else begin
            STATE <= START_DYN_CAL_PRE;
          end