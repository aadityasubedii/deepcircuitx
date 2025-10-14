        INCREMENT: begin      
          STATE               <= START_DYN_CAL; 
          MCB_UILDQSINC       <= 1'b0;          
          MCB_UIUDQSINC       <= 1'b0;          
          MCB_UILDQSDEC       <= 1'b0;          
          MCB_UIUDQSDEC       <= 1'b0;          
          case (Inc_Dec_REFRSH_Flag)            
            3'b101: begin
              counter_inc <= counter_inc + 1'b1;
                STATE               <= INCREMENT; 
              if (DQS_DELAY < DQS_DELAY_UPPER_LIMIT && counter_inc >= 8'h04) begin 
                MCB_UILDQSINC       <= 1'b1;      
                MCB_UIUDQSINC       <= 1'b1;      
                DQS_DELAY           <= DQS_DELAY + 1'b1;
              end
            end
            3'b100: begin
              if (DQS_DELAY < DQS_DELAY_UPPER_LIMIT)
                STATE                <= INCREMENT; 
              end
            default:  
                STATE               <= START_DYN_CAL; 
          endcase
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