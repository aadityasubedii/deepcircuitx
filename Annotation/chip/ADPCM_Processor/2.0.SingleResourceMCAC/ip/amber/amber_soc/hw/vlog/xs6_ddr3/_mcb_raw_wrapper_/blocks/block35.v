        always @ ( posedge ui_clk)
        begin 
          
          
          if (wait_200us_counter[14] && wait_200us_counter[13])
             wait_200us_done_r1 <= 1'b1;
          else
             wait_200us_done_r1 <= 1'b0;
          

          wait_200us_done_r2 <= wait_200us_done_r1;
        end