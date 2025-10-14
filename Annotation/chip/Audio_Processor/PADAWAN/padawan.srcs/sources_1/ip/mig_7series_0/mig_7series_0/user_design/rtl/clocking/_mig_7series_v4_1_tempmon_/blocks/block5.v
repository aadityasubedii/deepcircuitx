      always @(posedge xadc_clk)
        if(rst_r2)
          temperature <= #TCQ 12'b0;
        else if(tempmon_state == READ)
          temperature <= #TCQ xadc_do_r[15:4];
