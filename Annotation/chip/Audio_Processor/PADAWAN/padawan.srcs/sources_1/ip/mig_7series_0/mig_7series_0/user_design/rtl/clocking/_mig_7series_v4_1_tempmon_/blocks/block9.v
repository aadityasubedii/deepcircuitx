      always @(posedge xadc_clk)
        if(rst_r2 || (tempmon_state == WAIT_FOR_READ))
          sample_timer_clr <= #TCQ 1'b0;
        else if(tempmon_state == REQUEST_READ_TEMP)
          sample_timer_clr <= #TCQ 1'b1;
