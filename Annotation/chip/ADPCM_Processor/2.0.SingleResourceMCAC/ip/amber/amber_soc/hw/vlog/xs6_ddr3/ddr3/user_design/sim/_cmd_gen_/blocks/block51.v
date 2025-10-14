always @(posedge clk_i) begin 
    cmd_vld          <=  #TCQ (cmd_clk_en | (mode_load_pulse & first_load_pulse )); 
                   
end