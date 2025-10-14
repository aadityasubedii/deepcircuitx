  always @ (posedge clk_i)
  begin
   if (rst_i)
        w1data <= #TCQ  'b0;
   
   else if((fifo_rdy_i && user_burst_cnt != 6'd0) || cmd_startC )

    
    
      if (NUM_DQ_PINS == 16) 
      begin
         if(cmd_startC)
           begin

             case (addr_i[4:3])

             
                 0: begin 
                    
                    w1data[2*DWIDTH/4-1:0*DWIDTH/4]    <= #TCQ    SHIFTB_0; 
                    w1data[4*DWIDTH/4-1:2*DWIDTH/4]    <= #TCQ    SHIFTB_1;
 
                    end
                 1:  begin 
                    w1data[2*DWIDTH/4-1:0*DWIDTH/4]    <= #TCQ    SHIFTB_2; 
                    w1data[4*DWIDTH/4-1:2*DWIDTH/4]    <= #TCQ    SHIFTB_3;
                    end
                    
                 2: begin 
                    w1data[2*DWIDTH/4-1:0*DWIDTH/4]    <= #TCQ    SHIFTB_4; 
                    w1data[4*DWIDTH/4-1:2*DWIDTH/4]    <= #TCQ    SHIFTB_5;
                    end
                 3:  begin 
                    w1data[2*DWIDTH/4-1:0*DWIDTH/4]    <= #TCQ    SHIFTB_6; 
                    w1data[4*DWIDTH/4-1:2*DWIDTH/4]    <= #TCQ    SHIFTB_7;
                    
                    end
                     
                    
               default :begin
                    w1data <= #TCQ  BLANK;    
                    end
                    
             endcase         

                      
           end  
         else begin  
             if (data_mode_i == 3'b100) 
               begin
                 w1data[63:48] <= #TCQ    {16'h0000};
                 w1data[47:32] <= #TCQ    {w1data[45:32],w1data[47:46]};
                 w1data[31:16] <= #TCQ    {16'h0000};
                 w1data[15:0]  <= #TCQ    {w1data[13:0],w1data[15:14]};
                 
               end
            else

              w1data[DWIDTH - 1:0] <= #TCQ    {
                                          w1data[4*DWIDTH/4 - 5:4*DWIDTH/4 - 16],
                                          w1data[4*DWIDTH/4 - 1 :4*DWIDTH/4 - 4],                                                    
                                                        
                                          w1data[3*DWIDTH/4 - 5:3*DWIDTH/4 - 16],
                                          w1data[3*DWIDTH/4 - 1 :3*DWIDTH/4 - 4],                                                                                                        

                                          w1data[2*DWIDTH/4 - 5:2*DWIDTH/4 - 16],
                                          w1data[2*DWIDTH/4 - 1 :2*DWIDTH/4 - 4],
 
                                          w1data[1*DWIDTH/4 - 5:1*DWIDTH/4 - 16],
                                          w1data[1*DWIDTH/4 - 1 :1*DWIDTH/4 - 4]                                                    
                                          
                                          };   
                                                    
              
         end    
              
      end  
      else if (NUM_DQ_PINS == 8) begin
         if(cmd_startC)  

                 if (data_mode_i == 3'b100)  
                 
                   case (addr_i[3])
                 
                   
                       0:  w1data <= #TCQ    {
                                   BLANK,SHIFT_3,BLANK,SHIFT_2,
                                   BLANK,SHIFT_1,BLANK,SHIFT_0
                                   };                        
                         
                       1:  w1data <= #TCQ    {
                                   BLANK,SHIFT_7,BLANK,SHIFT_6,
                                   BLANK,SHIFT_5,BLANK,SHIFT_4
                                   };                        
                    
                       default :begin
                         w1data <= #TCQ    'b0;    
                    end
                    
                    endcase         

                  else
                  w1data <= #TCQ    {32'h8040_2010,32'h0804_0201};  
         else  
                 if (data_mode_i == 3'b100)  
         
               begin
                 w1data[63:56] <= #TCQ    {8'h00};
                 w1data[55:48] <= #TCQ    {w1data[51:48],w1data[55:52]};
                 
                 w1data[47:40] <= #TCQ    {8'h00};                 
                 w1data[39:32] <= #TCQ    {w1data[35:32],w1data[39:36]};
                 
                 w1data[31:24] <= #TCQ    {8'h00};
                 w1data[23:16] <= #TCQ    {w1data[19:16],w1data[23:20]};
                 
                 w1data[15:8]  <= #TCQ    {8'h00};
                 w1data[7:0]  <= #TCQ    {w1data[3:0],w1data[7:4]};
                 
               end
                 else
                      w1data <= #TCQ    w1data; 
      end 
      else if (NUM_DQ_PINS == 4) 
            if (data_mode_i == 3'b100)  
               w1data <= #TCQ    64'h0804_0201_0804_0201;
            else
               w1data <= #TCQ    64'h8421_8421_8421_8421; 
           
  end