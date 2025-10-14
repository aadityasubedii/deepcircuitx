  always @ (posedge clk_i)
  begin
   if (rst_i) begin
        w1data <= #TCQ  'b0;
        ndata_rising <= #TCQ  1'b1;
        shift_en <= #TCQ  1'b0;
        end
   else if((fifo_rdy_i && user_burst_cnt != 6'd0) || cmd_startC )
      if (NUM_DQ_PINS == 16) 
      begin
         if(cmd_startC) 
           begin
                      case (addr_i[4:2])
                      0: w1data <= #TCQ    SHIFTB_0;
                      1: w1data <= #TCQ    SHIFTB_1;
                      2: w1data <= #TCQ    SHIFTB_2;
                      3: w1data <= #TCQ    SHIFTB_3;
                      4: w1data <= #TCQ    SHIFTB_4;
                      5: w1data <= #TCQ    SHIFTB_5;
                      6: w1data <= #TCQ    SHIFTB_6;
                      7: w1data <= #TCQ    SHIFTB_7;
                      
                      default :w1data <= #TCQ    SHIFTB_0;
                      endcase   
                      
                      ndata_rising <= #TCQ  1'b0;
           end  
         else 
            if (data_mode_i == 3'b100) 
              w1data <= #TCQ    {16'h0000,w1data[14:0],w1data[15]};
            else
              w1data <= #TCQ    {w1data[29:16],w1data[31:30],w1data[13:0],w1data[15:14]}; 
              
              
      end  
      else if (NUM_DQ_PINS == 8) begin
         if(cmd_startC)  
            begin
                       case (addr_i[2])
                        0: w1data <= #TCQ    SHIFTB_0;
                        1: w1data <= #TCQ    SHIFTB_1;
                        default :w1data <= #TCQ    SHIFTB_0;
                       endcase 
            end 
        else  
          
                w1data <= #TCQ    {w1data[27:24],w1data[31:28],w1data[19:16],w1data[23:20],
                                w1data[11:8] ,w1data[15:12],w1data[3:0]  ,w1data[7:4]}; 
                      
      end 
      else if (NUM_DQ_PINS == 4) begin   
          
             if (data_mode_i == 3'b100) 
               w1data <= #TCQ    32'h0804_0201;
             else
               w1data <= #TCQ    32'h8421_8421;
      end 
           
  end
end