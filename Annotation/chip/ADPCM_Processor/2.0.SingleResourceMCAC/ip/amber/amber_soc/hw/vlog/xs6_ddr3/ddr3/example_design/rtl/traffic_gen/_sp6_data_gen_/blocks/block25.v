always @ (adata,hdata,ndata,w1data,prbs_data,data_mode_i,fixed_data_i)
begin
   case(data_mode_i)
       
         4'b0001: data = fixed_data_i;       
         4'b0010: data = adata;  
         4'b0011: data = hdata;  
         4'b0100: data = ndata;  
         4'b0101: data = w1data; 
         4'b0110: data = w1data; 
         4'b0111: data = prbs_data;
         default : data = 'b0;
   endcase
end        