always @(posedge clk_i) begin 
    cmd_vld          <=  #TCQ (cmd_clk_en ); 
                   
end