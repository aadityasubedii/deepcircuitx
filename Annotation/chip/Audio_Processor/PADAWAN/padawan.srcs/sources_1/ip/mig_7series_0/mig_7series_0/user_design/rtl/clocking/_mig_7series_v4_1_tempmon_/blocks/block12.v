      always @(posedge xadc_clk)
        if(rst_r2)
          tempmon_state <= #TCQ INIT_IDLE;
        else
          tempmon_state <= #TCQ tempmon_next_state;