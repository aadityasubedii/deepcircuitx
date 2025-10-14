  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          break_readreg <= 32'b0;
      else if (take_action_any_break)
          break_readreg <= jdo[31 : 0];
      else if (take_no_action_break_a)
          case (break_a_wpr_high_bits)
          
              2'd0: begin
                  case (break_a_wpr_low_bits) 
                  
                      2'd0: begin
                          break_readreg <= xbrk0_value;
                      end 
                  
                      2'd1: begin
                          break_readreg <= xbrk1_value;
                      end 
                  
                      2'd2: begin
                          break_readreg <= xbrk2_value;
                      end 
                  
                      2'd3: begin
                          break_readreg <= xbrk3_value;
                      end 
                  
                  endcase 
              end 
          
              2'd1: begin
                  break_readreg <= 32'b0;
              end 
          
              2'd2: begin
                  case (break_a_wpr_low_bits) 
                  
                      2'd0: begin
                          break_readreg <= dbrk0_low_value;
                      end 
                  
                      2'd1: begin
                          break_readreg <= dbrk1_low_value;
                      end 
                  
                      2'd2: begin
                          break_readreg <= dbrk2_low_value;
                      end 
                  
                      2'd3: begin
                          break_readreg <= dbrk3_low_value;
                      end 
                  
                  endcase 
              end 
          
              2'd3: begin
                  case (break_a_wpr_low_bits) 
                  
                      2'd0: begin
                          break_readreg <= dbrk0_high_value;
                      end 
                  
                      2'd1: begin
                          break_readreg <= dbrk1_high_value;
                      end 
                  
                      2'd2: begin
                          break_readreg <= dbrk2_high_value;
                      end 
                  
                      2'd3: begin
                          break_readreg <= dbrk3_high_value;
                      end 
                  
                  endcase 
              end 
          
          endcase 
      else if (take_no_action_break_b)
          break_readreg <= jdo[31 : 0];
      else if (take_no_action_break_c)
          break_readreg <= jdo[31 : 0];
    end