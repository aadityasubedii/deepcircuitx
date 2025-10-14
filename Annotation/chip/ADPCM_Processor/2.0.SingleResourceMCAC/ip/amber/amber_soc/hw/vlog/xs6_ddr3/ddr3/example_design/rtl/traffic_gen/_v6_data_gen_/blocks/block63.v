function [4*NUM_DQ_PINS-1:0] Data_GenW0 (input integer i);
 integer j;
  begin
    j = i/2;
    Data_GenW0 = {4*NUM_DQ_PINS{1'b1}};
    
        if(i %2) begin
             Data_GenW0[(0*NUM_DQ_PINS+j*8)+:8] = 8'b11101111;
             Data_GenW0[(1*NUM_DQ_PINS+j*8)+:8] = 8'b11011111;
             Data_GenW0[(2*NUM_DQ_PINS+j*8)+:8] = 8'b10111111;
             Data_GenW0[(3*NUM_DQ_PINS+j*8)+:8] = 8'b01111111;
             
        end else begin
            Data_GenW0[(0*NUM_DQ_PINS+j*8)+:8] = 8'b11111110;
            Data_GenW0[(1*NUM_DQ_PINS+j*8)+:8] = 8'b11111101;
            Data_GenW0[(2*NUM_DQ_PINS+j*8)+:8] = 8'b11111011;
            Data_GenW0[(3*NUM_DQ_PINS+j*8)+:8] = 8'b11110111;
          
        end
        
    
  end
endfunction