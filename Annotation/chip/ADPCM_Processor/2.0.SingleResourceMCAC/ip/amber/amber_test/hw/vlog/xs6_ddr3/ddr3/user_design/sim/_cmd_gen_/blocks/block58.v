always @(posedge clk_i) begin                    

     instr_vld        <=  #TCQ  (cmd_clk_en | (mode_load_pulse & first_load_pulse));
     bl_out_clk_en    <=  #TCQ  (cmd_clk_en | (mode_load_pulse & first_load_pulse));
     bl_out_vld       <=  #TCQ  bl_out_clk_en;
     pipe_data_in_vld <=  #TCQ  instr_vld;
 end