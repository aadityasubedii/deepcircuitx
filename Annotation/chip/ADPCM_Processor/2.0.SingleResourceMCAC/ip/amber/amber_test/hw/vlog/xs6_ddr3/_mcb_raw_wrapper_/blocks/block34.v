        always @ ( posedge ui_clk, posedge int_sys_rst)
        begin 
        if (int_sys_rst)
           cke_train_reg <= 1'b0;
        else 
           if ( wait_200us_done_r1 && ~wait_200us_done_r2 )
               cke_train_reg <= 1'b1;
           else if ( uo_done_cal)
               cke_train_reg <= 1'b0;
        end
        