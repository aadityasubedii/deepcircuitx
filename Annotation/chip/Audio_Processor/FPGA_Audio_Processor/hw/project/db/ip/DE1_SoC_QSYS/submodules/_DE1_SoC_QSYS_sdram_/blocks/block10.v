  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          i_state <= 3'b000;
          i_next <= 3'b000;
          i_cmd <= 4'b1111;
          i_addr <= {13{1'b1}};
          i_count <= {4{1'b0}};
        end
      else 
        begin
          i_addr <= {13{1'b1}};
          case (i_state) 
          
              3'b000: begin
                  i_cmd <= 4'b1111;
                  i_refs <= 3'b0;
                  
                  if (refresh_counter == 0)
                      i_state <= 3'b001;
              end 
          
              3'b001: begin
                  i_state <= 3'b011;
                  i_cmd <= {{1{1'b0}},3'h2};
                  i_count <= 2;
                  i_next <= 3'b010;
              end 
          
              3'b010: begin
                  i_cmd <= {{1{1'b0}},3'h1};
                  i_refs <= i_refs + 1'b1;
                  i_state <= 3'b011;
                  i_count <= 10;
                  
                  if (i_refs == 3'h1)
                      i_next <= 3'b111;
                  else 
                    i_next <= 3'b010;
              end 
          
              3'b011: begin
                  i_cmd <= {{1{1'b0}},3'h7};
                  
                  if (i_count > 1)
                      i_count <= i_count - 1'b1;
                  else 
                    i_state <= i_next;
              end 
          
              3'b101: begin
                  i_state <= 3'b101;
              end 
          
              3'b111: begin
                  i_state <= 3'b011;
                  i_cmd <= {{1{1'b0}},3'h0};
                  i_addr <= {{3{1'b0}},1'b0,2'b00,3'h3,4'h0};
                  i_count <= 4;
                  i_next <= 3'b101;
              end 
          
              default: begin
                  i_state <= 3'b000;
              end 
          
          endcase 
        end
    end