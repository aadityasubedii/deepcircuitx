      always @(posedge clk)
        if (rst || wrlvl_odt_ctl)
          wrlvl_odt <= #TCQ 1'b0;
        else if (enable_wrlvl_cnt == 5'd1)
          wrlvl_odt <= #TCQ 1'b1;
          
    end else begin: en_cnt_div2  