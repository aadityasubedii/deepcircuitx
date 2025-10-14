        always @(posedge clk) ckesr_timer_r <= #TCQ ckesr_timer_ns;
        
        assign inhbt_srx = |ckesr_timer_r;
      
      end 