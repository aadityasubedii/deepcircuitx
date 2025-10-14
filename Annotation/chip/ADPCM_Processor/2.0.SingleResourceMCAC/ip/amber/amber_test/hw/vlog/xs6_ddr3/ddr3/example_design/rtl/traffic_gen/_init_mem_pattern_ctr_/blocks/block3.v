 always @ (posedge clk_i)
 begin
 if (rst_i || (FAMILY == "VIRTEX6")) 
      if  (FAMILY == "VIRTEX6")
         bl_mode_sel <= FIXED_BL_MODE;
      else
       bl_mode_sel <= PRBS_BL_MODE;
 else if (vio_modify_enable == 1'b1) begin
       bl_mode_sel <= vio_bl_mode_value;
       end
 end