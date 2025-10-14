  always @(entry_0 or entry_1 or rd_address)
    begin
      case (rd_address) 
      
          1'd0: begin
              rd_data <= entry_0;
          end 
      
          1'd1: begin
              rd_data <= entry_1;
          end 
      
          default: begin
          end 
      
      endcase 
    end