 always @ (posedge clk_i)
 begin
 if (rst_i  || FAMILY == "VIRTEX6") 
       fix_bl_value <= FIXED_BL_VALUE;

 else if (vio_modify_enable == 1'b1) begin
       fix_bl_value <= vio_fixed_bl_value;
       end
 end