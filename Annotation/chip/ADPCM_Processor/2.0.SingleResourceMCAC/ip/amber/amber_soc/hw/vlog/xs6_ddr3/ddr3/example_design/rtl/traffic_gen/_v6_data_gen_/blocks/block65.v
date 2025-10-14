always @ (data_mode_rr_a,fixed_data_i,h_prbsdata,adata,hdata,ndata,w1data,full_prbs_data)
begin
   case(data_mode_rr_a)
         4'b0000: data = h_prbsdata;
         4'b0001: data = fixed_data_i;   
         4'b0010: data = adata;   
         4'b0011: data = hdata;   
         4'b0100: data = ndata;   
         4'b0101: data = w1data;    
         4'b0110: data = w1data;  
         4'b0111: data = full_prbs_data;
         default : data = 'b0;
   endcase
end