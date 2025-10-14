always @ (posedge clk_i)
 if (push_cmd)
   begin
        cmd_reg <=    #TCQ cmd_i;
        addr_reg <= #TCQ addr_i;
        bl_reg   <= #TCQ bl_i - 1;
        
end