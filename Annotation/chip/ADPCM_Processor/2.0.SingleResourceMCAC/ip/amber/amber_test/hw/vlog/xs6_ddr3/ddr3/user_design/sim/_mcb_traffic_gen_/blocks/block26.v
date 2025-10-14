   assign bram_addr_i = {bram_cmd_i[29:0],2'b00};
   assign bram_instr_i = bram_cmd_i[32:30];
   assign bram_bl_i[5:0] = bram_cmd_i[38:33];