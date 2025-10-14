      always @ (posedge xadc_clk)
        if(rst_r2 || sample_timer_clr)
          sample_timer <= #TCQ {nTEMPSAMP_CNTR_WIDTH{1'b0}};
        else if(sample_timer_en)
          sample_timer <= #TCQ sample_timer + 1'b1;
