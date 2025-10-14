        always @ (posedge ui_clk, posedge int_sys_rst)
        begin
            if (int_sys_rst)
                wait_200us_counter <= 'b0;
            else 
               if (wait_200us_counter[15])  
                   wait_200us_counter <= wait_200us_counter                        ;
               else
                   wait_200us_counter <= wait_200us_counter + 1'b1;
        end 