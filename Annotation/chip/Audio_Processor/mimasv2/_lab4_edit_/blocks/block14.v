  initial begin
    ready <= 1'b0;
    
    ac97_sdata_out <= 1'b0;
    
    ac97_synch <= 1'b0;
    

    bit_count <= 8'h00;
    
    l_cmd_v <= 1'b0;
    
    l_left_v <= 1'b0;
    
    l_right_v <= 1'b0;
    

    left_in_data <= 20'h00000;
    
    right_in_data <= 20'h00000;
    
  end