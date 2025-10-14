        end
        DECREMENT: begin      
          STATE               <= START_DYN_CAL; 
          MCB_UILDQSINC       <= 1'b0;          
          MCB_UIUDQSINC       <= 1'b0;          
          MCB_UILDQSDEC       <= 1'b0;          
          MCB_UIUDQSDEC       <= 1'b0;          
          if (DQS_DELAY != 8'h00) begin
            case (Inc_Dec_REFRSH_Flag)            
              3'b011: begin
                counter_dec <= counter_dec + 1'b1;
                  STATE               <= DECREMENT; 