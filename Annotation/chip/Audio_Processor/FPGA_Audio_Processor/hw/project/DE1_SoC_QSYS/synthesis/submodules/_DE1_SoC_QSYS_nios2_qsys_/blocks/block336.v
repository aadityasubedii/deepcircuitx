  always @(switch_for_mux)
    begin
      case (switch_for_mux)
      
          3'b000: begin
              compute_input_tm_cnt = 0;
          end 
      
          3'b001: begin
              compute_input_tm_cnt = 1;
          end 
      
          3'b010: begin
              compute_input_tm_cnt = 1;
          end 
      
          3'b011: begin
              compute_input_tm_cnt = 2;
          end 
      
          3'b100: begin
              compute_input_tm_cnt = 1;
          end 
      
          3'b101: begin
              compute_input_tm_cnt = 2;
          end 
      
          3'b110: begin
              compute_input_tm_cnt = 2;
          end 
      
          3'b111: begin
              compute_input_tm_cnt = 3;
          end 
      
      endcase 
    end