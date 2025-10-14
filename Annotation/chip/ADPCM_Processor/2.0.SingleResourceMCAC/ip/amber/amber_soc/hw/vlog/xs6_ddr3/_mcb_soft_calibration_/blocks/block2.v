          MCB_UILDQSDEC       <= 1'b0;          
          MCB_UIUDQSDEC       <= 1'b0;          
          if (DQS_DELAY != 8'h00) begin
            case (Inc_Dec_REFRSH_Flag)            
              3'b011: begin
                counter_dec <= counter_dec + 1'b1;
                  STATE               <= DECREMENT; 
                if (DQS_DELAY > DQS_DELAY_LOWER_LIMIT  && counter_dec >= 8'h04) begin 
                  MCB_UILDQSDEC       <= 1'b1;      
                  MCB_UIUDQSDEC       <= 1'b1;      
                  DQS_DELAY           <= DQS_DELAY - 1'b1; 
                end
              end
              3'b010: begin
                if (DQS_DELAY > DQS_DELAY_LOWER_LIMIT) 
                  STATE                 <= DECREMENT; 
                end
              default: begin
                  STATE               <= START_DYN_CAL; 
              end