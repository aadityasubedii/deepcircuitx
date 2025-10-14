        DECREMENT: begin      
          STATE               <= START_DYN_CAL; 
          MCB_UILDQSINC       <= 1'b0;          
          MCB_UIUDQSINC       <= 1'b0;          
          MCB_UILDQSDEC       <= 1'b0;          
          MCB_UIUDQSDEC       <= 1'b0;          
          if (DQS_DELAY != 8'h00) begin