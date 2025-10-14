  always @(index or select)
     case (select[3:0])           
4'd1: begin 
         case (index[4:0]) 
			  5'd0:  coeff = -10'sd1;  
           5'd1:  coeff = -10'sd2;  
           5'd2:  coeff = -10'sd3;   
           5'd3:  coeff = -10'sd5;   
           5'd4:  coeff = -10'sd6;   
           5'd5:  coeff = -10'sd7;   
           5'd6:  coeff = -10'sd5;   
           5'd7:  coeff = -10'sd0;    
           5'd8:  coeff = 10'sd11;
           5'd9:  coeff = 10'sd27;
           5'd10: coeff = 10'sd47;
           5'd11: coeff = 10'sd69;
           5'd12: coeff = 10'sd91;
           5'd13: coeff = 10'sd110;  
           5'd14: coeff = 10'sd122;  
           5'd15: coeff = 10'sd127;  
           5'd16: coeff = 10'sd122;  
           5'd17: coeff = 10'sd110;  
           5'd18: coeff = 10'sd91;
           5'd19: coeff = 10'sd69;
           5'd20: coeff = 10'sd47;
           5'd21: coeff = 10'sd27;
           5'd22: coeff = 10'sd11;
           5'd23: coeff = 10'sd0;
           5'd24: coeff = -10'sd5;
           5'd25: coeff = -10'sd7;
           5'd26: coeff = -10'sd6;
           5'd27: coeff = -10'sd5;
           5'd28: coeff = -10'sd3;
           5'd29: coeff = -10'sd2;
           5'd30: coeff = -10'sd1;
           default: coeff = 10'h0;
         endcase 
end 
4'd2: begin  
         case (index[4:0])          
           5'd0:  coeff = -10'sd8;  
           5'd1:  coeff = -10'sd9;  
           5'd2:  coeff = -10'sd13;   
           5'd3:  coeff = -10'sd18;   
           5'd4:  coeff = -10'sd22;   
           5'd5:  coeff = -10'sd25;   
           5'd6:  coeff = -10'sd24;   
           5'd7:  coeff = -10'sd17;    
           5'd8: coeff =  -10'sd4;
           5'd9: coeff =   10'sd15;
           5'd10: coeff =  10'sd39;
           5'd11: coeff =  10'sd65;
           5'd12: coeff =  10'sd90;
           5'd13: coeff =  10'sd112;
           5'd14: coeff =  10'sd126;
           5'd15:  coeff = 10'sd131;  
           5'd16:  coeff = 10'sd126;
           5'd17: coeff =  10'sd112;
           5'd18: coeff =  10'sd90;
           5'd19: coeff =  10'sd65;
           5'd20: coeff =  10'sd39;  
           5'd21: coeff =  10'sd15;  
           5'd22: coeff = -10'sd4;  
           5'd23: coeff = -10'sd17;  
           5'd24: coeff = -10'sd24;  
           5'd25: coeff = -10'sd25;
           5'd26: coeff = -10'sd22;
           5'd27: coeff = -10'sd18;
           5'd28: coeff = -10'sd13;
           5'd29: coeff = -10'sd9;
           5'd30: coeff = -10'sd8;
           default: coeff = 10'h0;
         endcase  
		 end
		 
		 4'd3: begin  
         case (index[4:0])          
           5'd0:  coeff =  10'sd1;  
           5'd1:  coeff =  10'sd1;  
           5'd2:  coeff =  10'sd1;   
           5'd3:  coeff =  10'sd1;   
           5'd4:  coeff =  10'sd1;   
           5'd5:  coeff =  10'sd0;   
           5'd6:  coeff = -10'sd2;   
           5'd7:  coeff = -10'sd6;    
           5'd8: coeff =  -10'sd11;
           5'd9: coeff =  -10'sd18;
           5'd10: coeff = -10'sd25;
           5'd11: coeff = -10'sd33;
           5'd12: coeff = -10'sd40;
           5'd13: coeff = -10'sd46;
           5'd14: coeff = -10'sd49;
           5'd15:  coeff = 10'sd462;  
           5'd16:  coeff =-10'sd49;
           5'd17: coeff = -10'sd46;
           5'd18: coeff = -10'sd40;
           5'd19: coeff = -10'sd33;
           5'd20: coeff = -10'sd25;  
           5'd21: coeff = -10'sd18;  
           5'd22: coeff = -10'sd11;  
           5'd23: coeff = -10'sd6;  
           5'd24: coeff = -10'sd2;  
           5'd25: coeff = -10'sd0;
           5'd26: coeff =  10'sd1;
           5'd27: coeff =  10'sd1;
           5'd28: coeff =  10'sd1;
           5'd29: coeff =  10'sd1;
           5'd30: coeff =  10'sd1;
           default: coeff = 10'h0;
         endcase  
		 end
		 
		 default: coeff = 10'h0;  
     endcase