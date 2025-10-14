   always @ (posedge clk_i)
     begin
       if (cmp_data_en)
           l_data_error <= #TCQ (rd_data_r[DWIDTH/2-1:0] !== cmp_data_r[DWIDTH/2-1:0]);           
        else
           l_data_error <= #TCQ 1'b0;

       if (cmp_data_en)
           u_data_error <= #TCQ (rd_data_r[DWIDTH-1:DWIDTH/2] !== cmp_data_r[DWIDTH-1:DWIDTH/2]);           
        else
           u_data_error <= #TCQ 1'b0;

       data_error <= #TCQ l_data_error | u_data_error;
      
      if (data_error)
        $display ("ERROR: Expected data=%h and recieved data= %h @ %t" ,cmp_data_r4, rd_data_r4, $time);
      
        
     end