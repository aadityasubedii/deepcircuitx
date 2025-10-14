  always @(posedge clk)
    begin
      
      if (wr & !full)
          case (wr_address) 
          
              1'd0: begin
                  entry_0 <= wr_data;
              end 
          
              1'd1: begin
                  entry_1 <= wr_data;
              end 
          
              default: begin
              end 
          
          endcase 
    end