always @(cmd_valid_i,cmd_valid_r1,cmd_rdy,user_bl_cnt_is_1,rd_mdata_en)
begin
   if (FAMILY == "SPARTAN6") begin
       cmd_start = cmd_valid_i & cmd_rdy ;
       cmd_start_b = cmd_valid_i & cmd_rdy ;
       end
   else if (MEM_BURST_LEN == 4 && FAMILY == "VIRTEX6")  begin
       cmd_start =  rd_mdata_en;  
       cmd_start_b =  rd_mdata_en;  
           end
   else if (MEM_BURST_LEN == 8 && FAMILY == "VIRTEX6")   begin
       
       cmd_start = (~cmd_valid_r1 & cmd_valid_i) | user_bl_cnt_is_1;  
       cmd_start_b = (~cmd_valid_r1 & cmd_valid_i) | user_bl_cnt_is_1;  
       end

end