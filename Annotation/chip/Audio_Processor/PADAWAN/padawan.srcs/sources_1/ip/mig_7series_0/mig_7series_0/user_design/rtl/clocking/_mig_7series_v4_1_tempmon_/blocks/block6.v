      always @(posedge xadc_clk)
        if(rst_r2) begin
          xadc_drdy_r <= #TCQ 1'b0;
          xadc_do_r <= #TCQ 16'b0;
        end
        else begin
          xadc_drdy_r <= #TCQ xadc_drdy;
          xadc_do_r <= #TCQ xadc_do;
        end
