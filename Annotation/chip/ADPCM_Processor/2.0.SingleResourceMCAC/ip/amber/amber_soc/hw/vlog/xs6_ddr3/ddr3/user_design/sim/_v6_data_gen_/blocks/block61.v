function [4*NUM_DQ_PINS-1:0] Data_Gen (input integer i );
 integer j;
  begin
    j = i/2;
    Data_Gen = {4*NUM_DQ_PINS{1'b0}};
        if(i %2) begin
             Data_Gen[(0*NUM_DQ_PINS+j*8)+:8] = 8'b00010000;
             Data_Gen[(1*NUM_DQ_PINS+j*8)+:8] = 8'b00100000;
             Data_Gen[(2*NUM_DQ_PINS+j*8)+:8] = 8'b01000000;
             Data_Gen[(3*NUM_DQ_PINS+j*8)+:8] = 8'b10000000;
             
        end else begin
            Data_Gen[(0*NUM_DQ_PINS+j*8)+:8] = 8'b00000001;
            Data_Gen[(1*NUM_DQ_PINS+j*8)+:8] = 8'b00000010;
            Data_Gen[(2*NUM_DQ_PINS+j*8)+:8] = 8'b00000100;
            Data_Gen[(3*NUM_DQ_PINS+j*8)+:8] = 8'b00001000;
          
        end
       
    
  end
endfunction