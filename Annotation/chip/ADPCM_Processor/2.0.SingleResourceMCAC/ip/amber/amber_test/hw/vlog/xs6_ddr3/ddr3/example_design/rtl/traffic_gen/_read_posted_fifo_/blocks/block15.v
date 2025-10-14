   always @ (posedge clk_i)
       cmd_rdy_o <= #TCQ !full  & dfifo_has_enough_room & wait_done;
