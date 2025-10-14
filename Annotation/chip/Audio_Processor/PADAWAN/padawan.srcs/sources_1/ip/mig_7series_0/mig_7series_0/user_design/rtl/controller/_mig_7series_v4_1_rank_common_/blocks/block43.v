        always @(insert_maint_r1 or ckesr_timer_r or maint_sre_r_lcl) begin
        
          ckesr_timer_ns = ckesr_timer_r;

          if (insert_maint_r1 && maint_sre_r_lcl)
            ckesr_timer_ns = nCKESR_CLKS[CKESR_TIMER_WIDTH-1:0];
          else if(|ckesr_timer_r)
            ckesr_timer_ns = ckesr_timer_r - ONE[CKESR_TIMER_WIDTH-1:0];
        
        end