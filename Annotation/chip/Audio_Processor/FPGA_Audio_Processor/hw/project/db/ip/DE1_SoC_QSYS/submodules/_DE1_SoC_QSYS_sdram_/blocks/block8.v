  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          m_state <= 9'b000000001;
          m_next <= 9'b000000001;
          m_cmd <= 4'b1111;
          m_bank <= 2'b00;
          m_addr <= 13'b0000000000000;
          m_data <= 16'b0000000000000000;
          m_dqm <= 2'b00;
          m_count <= 4'b0000;
          ack_refresh_request <= 1'b0;
          f_pop <= 1'b0;
          oe <= 1'b0;
        end
      else 
        begin
          f_pop <= 1'b0;
          oe <= 1'b0;
          case (m_state) 
          
              9'b000000001: begin
                  
                  if (init_done)
                    begin
                      
                      if (refresh_request)
                          m_cmd <= {{1{1'b0}},3'h7};
                      else 
                        m_cmd <= 4'b1111;
                      ack_refresh_request <= 1'b0;
                      
                      if (refresh_request)
                        begin
                          m_state <= 9'b001000000;
                          m_next <= 9'b010000000;
                          m_count <= 2;
                          active_cs_n <= 1'b1;
                        end
                      else if (!f_empty)
                        begin
                          f_pop <= 1'b1;
                          active_cs_n <= f_cs_n;
                          active_rnw <= f_rnw;
                          active_addr <= f_addr;
                          active_data <= f_data;
                          active_dqm <= f_dqm;
                          m_state <= 9'b000000010;
                        end
                    end
                  else 
                    begin
                      m_addr <= i_addr;
                      m_state <= 9'b000000001;
                      m_next <= 9'b000000001;
                      m_cmd <= i_cmd;
                    end
              end 
          
              9'b000000010: begin
                  m_state <= 9'b000000100;
                  m_cmd <= {csn_decode,3'h3};
                  m_bank <= active_bank;
                  m_addr <= active_addr[23 : 11];
                  m_data <= active_data;
                  m_dqm <= active_dqm;
                  m_count <= 3;
                  m_next <= active_rnw ? 9'b000001000 : 9'b000010000;
              end 
          
              9'b000000100: begin
                  
                  if (m_next == 9'b010000000)
                      m_cmd <= {{1{1'b0}},3'h7};
                  else 
                    m_cmd <= {csn_decode,3'h7};
                  
                  if (m_count > 1)
                      m_count <= m_count - 1'b1;
                  else 
                    m_state <= m_next;
              end 
          
              9'b000001000: begin
                  m_cmd <= {csn_decode,3'h5};
                  m_bank <= f_select ? f_bank : active_bank;
                  m_dqm <= f_select ? f_dqm  : active_dqm;
                  m_addr <= cas_addr;
                  
                  if (pending)
                    begin
                      
                      if (refresh_request)
                        begin
                          m_state <= 9'b000000100;
                          m_next <= 9'b000000001;
                          m_count <= 2;
                        end
                      else 
                        begin
                          f_pop <= 1'b1;
                          active_cs_n <= f_cs_n;
                          active_rnw <= f_rnw;
                          active_addr <= f_addr;
                          active_data <= f_data;
                          active_dqm <= f_dqm;
                        end
                    end
                  else 
                    begin
                      
                      if (~pending & f_pop)
                          m_cmd <= {csn_decode,3'h7};
                      m_state <= 9'b100000000;
                    end
              end 
          
              9'b000010000: begin
                  m_cmd <= {csn_decode,3'h4};
                  oe <= 1'b1;
                  m_data <= f_select ? f_data : active_data;
                  m_dqm <= f_select ? f_dqm  : active_dqm;
                  m_bank <= f_select ? f_bank : active_bank;
                  m_addr <= cas_addr;
                  
                  if (pending)
                    begin
                      
                      if (refresh_request)
                        begin
                          m_state <= 9'b000000100;
                          m_next <= 9'b000000001;
                          m_count <= 3;
                        end
                      else 
                        begin
                          f_pop <= 1'b1;
                          active_cs_n <= f_cs_n;
                          active_rnw <= f_rnw;
                          active_addr <= f_addr;
                          active_data <= f_data;
                          active_dqm <= f_dqm;
                        end
                    end
                  else 
                    begin
                      
                      if (~pending & f_pop)
                        begin
                          m_cmd <= {csn_decode,3'h7};
                          oe <= 1'b0;
                        end
                      m_state <= 9'b100000000;
                    end
              end 
          
              9'b000100000: begin
                  m_cmd <= {csn_decode,3'h7};
                  
                  if (m_count > 1)
                      m_count <= m_count - 1'b1;
                  else 
                    begin
                      m_state <= 9'b001000000;
                      m_count <= 2;
                    end
              end 
          
              9'b001000000: begin
                  m_state <= 9'b000000100;
                  m_addr <= {13{1'b1}};
                  
                  if (refresh_request)
                      m_cmd <= {{1{1'b0}},3'h2};
                  else 
                    m_cmd <= {csn_decode,3'h2};
              end 
          
              9'b010000000: begin
                  ack_refresh_request <= 1'b1;
                  m_state <= 9'b000000100;
                  m_cmd <= {{1{1'b0}},3'h1};
                  m_count <= 10;
                  m_next <= 9'b000000001;
              end 
          
              9'b100000000: begin
                  m_cmd <= {csn_decode,3'h7};
                  
                  if (refresh_request)
                    begin
                      m_state <= 9'b000000100;
                      m_next <= 9'b000000001;
                      m_count <= 2;
                    end
                  else 
                  if (!f_empty)
                      
                      if (csn_match && rnw_match && bank_match && row_match)
                        begin
                          m_state <= f_rnw ? 9'b000001000 : 9'b000010000;
                          f_pop <= 1'b1;
                          active_cs_n <= f_cs_n;
                          active_rnw <= f_rnw;
                          active_addr <= f_addr;
                          active_data <= f_data;
                          active_dqm <= f_dqm;
                        end
                      else 
                        begin
                          m_state <= 9'b000100000;
                          m_next <= 9'b000000001;
                          m_count <= 2;
                        end
              end 
          
              
          
              default: begin
                  m_state <= m_state;
                  m_cmd <= 4'b1111;
                  f_pop <= 1'b0;
                  oe <= 1'b0;
              end 
          
              
          endcase 
        end
    end