always @ (posedge clk_i)
begin
    if (rst_i[1] || manual_clear_error) begin
    
      error_byte_r1 <= #TCQ 'b0;
      data_error <= #TCQ 1'b0;
      end
    else begin
      error_byte_r1 <= #TCQ error_byte;
      data_error <= #TCQ | error_byte_r1;
    
    
      
      if (data_error)
        $display ("ERROR: Expected data=%h and recieved data= %h @ %t" ,cmp_data_r2,rd_v6_mdata_r2,$time);
      
    end

end