 always @ (posedge clk_i)
 begin
   if (rst_i) begin
        syn1_vio_data_mode_value <= 3'b011;
        syn1_vio_addr_mode_value <= 2'b11;
       end        
 else if (vio_modify_enable == 1'b1) begin
   syn1_vio_data_mode_value <= vio_data_mode_value;
   syn1_vio_addr_mode_value <= vio_addr_mode_value;
   end
 end