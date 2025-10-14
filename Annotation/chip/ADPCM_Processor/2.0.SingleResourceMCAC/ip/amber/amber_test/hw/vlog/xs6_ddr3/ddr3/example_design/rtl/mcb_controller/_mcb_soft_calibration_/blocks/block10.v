        end
        WAIT9:  begin     
          counter_en  <= 1'b1;
          if (count < 6'd38)  
            STATE     <= WAIT9;
          else
            STATE     <= READ_MAX_VALUE;
        end