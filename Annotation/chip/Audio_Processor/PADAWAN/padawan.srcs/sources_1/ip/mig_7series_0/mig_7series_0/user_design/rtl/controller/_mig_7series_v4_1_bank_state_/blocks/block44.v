  generate
  
    if((nCK_PER_CLK == 4) && (ADDR_CMD_MODE != "2T")) begin
    
      assign start_pre =  pre_wait_r && ras_timer_zero_r &&
                          (sending_pre || auto_pre_r);
      
      assign rts_pre = ~sending_pre && pre_request;
    
    end
    
    else begin
    
      assign start_pre =  pre_wait_r && ras_timer_zero_r &&
                          (sending_row || auto_pre_r);
                          
      assign rts_pre = 1'b0;
      
    end

  endgenerate