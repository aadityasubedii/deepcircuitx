always @(index)
 
     case (index[3:0])          
           4'd0:  delay =  12'd4079; 
           4'd1:  delay =  12'd3469;  
           4'd2:  delay =  12'd2579;   
           4'd3:  delay =  12'd1823;   
           4'd4:  delay =  12'd1;   
           4'd5:  delay =  12'd1;   
           4'd6:  delay =  12'd1;   
           4'd7:  delay =  12'd1;   
           4'd8:  delay =  12'd1;
           4'd9:  delay =  12'd1;
           4'd10: delay =  12'd1;
           4'd11: delay =  12'd1;
           4'd12: delay =  12'd1;
           4'd13: delay =  12'd1;  
           4'd14: delay =  12'd1;  
           4'd15: delay =  12'd1;    
           default: delay = 12'd1;
      
		endcase 