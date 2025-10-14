always @ (posedge clk_i)
begin
    data_mode_o   <= data_mode_sel;
    addr_mode_o   <= addr_mode;
    
    
    
    if (syn1_vio_addr_mode_value == 0 && vio_modify_enable == 1'b1)
        bram_mode_enable <=  1'b1;
    else
        bram_mode_enable <=  1'b0;
    
 end