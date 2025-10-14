 always @ (posedge clk_i)
 begin
 if (rst_i) begin
       data_mode_sel <= DATA_MODE;
       addr_mode_sel <= 2'b11;
       end
 else if (vio_modify_enable == 1'b1) begin
       data_mode_sel <= syn1_vio_data_mode_value[2:0];
       addr_mode_sel <= vio_addr_mode_value;
       end
 end