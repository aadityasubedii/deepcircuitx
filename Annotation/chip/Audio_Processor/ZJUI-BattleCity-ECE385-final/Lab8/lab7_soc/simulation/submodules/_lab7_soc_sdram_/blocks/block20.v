  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          wr_address <= 0;
          rd_address <= 0;
          entries <= 0;
        end
      else 
        case (rdwr) 
        
            2'd1: begin
                
                if (!full)
                  begin
                    entries <= entries + 1;
                    wr_address <= (wr_address == 1) ? 0 : (wr_address + 1);
                  end
            end 
        
            2'd2: begin
                
                if (!empty)
                  begin
                    entries <= entries - 1;
                    rd_address <= (rd_address == 1) ? 0 : (rd_address + 1);
                  end
            end 
        
            2'd3: begin
                wr_address <= (wr_address == 1) ? 0 : (wr_address + 1);
                rd_address <= (rd_address == 1) ? 0 : (rd_address + 1);
            end 
        
            default: begin
            end 
        
        endcase 
    end