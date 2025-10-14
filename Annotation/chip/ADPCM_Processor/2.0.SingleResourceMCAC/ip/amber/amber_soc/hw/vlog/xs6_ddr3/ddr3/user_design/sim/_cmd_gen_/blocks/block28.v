    always @ (posedge clk_i) begin
    
if ( (NUM_DQ_PINS >= 128 && NUM_DQ_PINS <= 144))       
     INC_COUNTS <= #TCQ  64 * (MEM_BURST_INT/4);
    
else if ( (NUM_DQ_PINS >= 64 && NUM_DQ_PINS < 128))       
     INC_COUNTS <= #TCQ  32 * (MEM_BURST_INT/4);
else if ((NUM_DQ_PINS >= 32) && (NUM_DQ_PINS < 64))   
     INC_COUNTS <= #TCQ  16 * (MEM_BURST_INT/4)   ;
else if ((NUM_DQ_PINS == 16) || (NUM_DQ_PINS == 24))  
     INC_COUNTS <= #TCQ  8 * (MEM_BURST_INT/4);
else if ((NUM_DQ_PINS == 8) )
     INC_COUNTS <= #TCQ  4 * (MEM_BURST_INT/4);
end