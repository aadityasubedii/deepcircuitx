always @ (posedge clk_i)
begin
if ( (DWIDTH >= 256 && DWIDTH <= 576))          
     INC_COUNTS <= 32  ;
else if ((DWIDTH >= 128) && (DWIDTH <= 224))    
     INC_COUNTS <= 16     ;
else if ((DWIDTH == 64) || (DWIDTH == 96))      
     INC_COUNTS <= 8  ;
else if ((DWIDTH == 32) )      
     INC_COUNTS <= 4 ;
end