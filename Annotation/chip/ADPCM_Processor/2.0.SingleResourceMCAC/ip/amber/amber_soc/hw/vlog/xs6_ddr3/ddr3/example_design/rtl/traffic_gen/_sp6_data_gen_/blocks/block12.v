  always @ (posedge clk_i)
  begin
   if (rst_i)
        w1data <= #TCQ  'b0;
   
   else if((fifo_rdy_i && user_burst_cnt != 6'd0) || cmd_startC )

    
    
      if (NUM_DQ_PINS == 16) 
      begin
         if(cmd_startC)
           begin
             case (addr_i[4])

             
                 0: begin 
                    
                    w1data[1*DWIDTH/4-1:0*DWIDTH/4]    <= #TCQ  SHIFTB_0;
                    w1data[2*DWIDTH/4-1:1*DWIDTH/4]    <= #TCQ  SHIFTB_1;   
                    w1data[3*DWIDTH/4-1:2*DWIDTH/4]    <= #TCQ  SHIFTB_2;                    
                    w1data[4*DWIDTH/4-1:3*DWIDTH/4]    <= #TCQ  SHIFTB_3;
                    
                    
                    end
                 1:  begin 
                 
                    w1data[1*DWIDTH/4-1:0*DWIDTH/4]    <= #TCQ  SHIFTB_4;
                    w1data[2*DWIDTH/4-1:1*DWIDTH/4]    <= #TCQ  SHIFTB_5;   
                    w1data[3*DWIDTH/4-1:2*DWIDTH/4]    <= #TCQ  SHIFTB_6;                    
                    w1data[4*DWIDTH/4-1:3*DWIDTH/4]    <= #TCQ  SHIFTB_7;
                 
                    end
 
              default :begin
                    w1data <= #TCQ  BLANK;    
                    
                    end
                    
             endcase         
                      
           end  
         else begin  
              if (data_mode_i == 3'b100) 
               begin
                 w1data[127:112] <= #TCQ    {16'h0000};
                 w1data[111:96] <= #TCQ    {w1data[107:96],w1data[111:108]};
                 w1data[95:80] <= #TCQ    {16'h0000};
                 w1data[79:64] <= #TCQ    {w1data[75:64],w1data[79:76]};


                 w1data[63:48] <= #TCQ    {16'h0000};
                 w1data[47:32] <= #TCQ    {w1data[43:32],w1data[47:44]};
                 w1data[31:16] <= #TCQ    {16'h0000};
                 w1data[15:0] <= #TCQ    {w1data[11:0],w1data[15:12]};
                 
               end
              else begin
              w1data[DWIDTH - 1:0]             <= #TCQ  {
                                                    w1data[4*DWIDTH/4 - 9:4*DWIDTH/4 - 16],
                                                    w1data[4*DWIDTH/4 - 1 :4*DWIDTH/4 - 8],                                                    
                                                    w1data[4*DWIDTH/4 - 25:4*DWIDTH/4 -32],
                                                    w1data[4*DWIDTH/4 - 17:4*DWIDTH/4 -24], 
                                                    
                                                    w1data[3*DWIDTH/4 - 9:3*DWIDTH/4 - 16],
                                                    w1data[3*DWIDTH/4 - 1 :3*DWIDTH/4 - 8],                                                                                                        
                                                    w1data[3*DWIDTH/4 - 25:3*DWIDTH/4 - 32],
                                                    w1data[3*DWIDTH/4 - 17:3*DWIDTH/4 - 24],

                                                    w1data[2*DWIDTH/4 - 9:2*DWIDTH/4 - 16],
                                                    w1data[2*DWIDTH/4 - 1 :2*DWIDTH/4 - 8],                                                                                                        
                                                    w1data[2*DWIDTH/4 - 25:2*DWIDTH/4 - 32],
                                                    w1data[2*DWIDTH/4 - 17:2*DWIDTH/4 - 24],


                                                    w1data[1*DWIDTH/4 - 9:1*DWIDTH/4 - 16],
                                                    w1data[1*DWIDTH/4 - 1 :1*DWIDTH/4 - 8],                                                    
                                                    w1data[1*DWIDTH/4 - 25:1*DWIDTH/4 - 32],
                                                    w1data[1*DWIDTH/4 - 17 :1*DWIDTH/4 - 24]
                                                    };
             end
            
         end    
              
      end  
      else if (NUM_DQ_PINS == 8) begin
         if(cmd_startC)  
            begin
                        if (data_mode_i == 3'b100)  
                         w1data <= #TCQ    {
                                          BLANK,SHIFT_7,BLANK,SHIFT_6,
                                          BLANK,SHIFT_5,BLANK,SHIFT_4,
                                          BLANK,SHIFT_3,BLANK,SHIFT_2,
                                          BLANK,SHIFT_1,BLANK,SHIFT_0
                                          };                        
                        else
                       
                         w1data <= #TCQ    {
                                          SHIFT_7,SHIFT_6,SHIFT_5,SHIFT_4,
                                          SHIFT_3,SHIFT_2,SHIFT_1,SHIFT_0,
                                          SHIFT_7,SHIFT_6,SHIFT_5,SHIFT_4,
                                          SHIFT_3,SHIFT_2,SHIFT_1,SHIFT_0
                                          };
                                          
                                          
            end 
        else  
         
                 begin
               
                      w1data <= #TCQ    w1data;
                 end 
      end 
      else  
         if (data_mode_i == 3'b100)  
          w1data <= #TCQ    128'h0804_0201_0804_0201_0804_0201_0804_0201;       
         else
          w1data <= #TCQ    128'h8421_8421_8421_8421_8421_8421_8421_8421; 
           
  end
end