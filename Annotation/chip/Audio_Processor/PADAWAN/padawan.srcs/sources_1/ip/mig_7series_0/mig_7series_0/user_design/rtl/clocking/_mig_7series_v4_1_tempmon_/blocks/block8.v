      always @(posedge xadc_clk)
        if(rst_r2 || (tempmon_state == REQUEST_READ_TEMP))
          sample_timer_en <= #TCQ 1'b0;
        else if((tempmon_state == INIT_IDLE) || (tempmon_state == READ))
          sample_timer_en <= #TCQ 1'b1;
