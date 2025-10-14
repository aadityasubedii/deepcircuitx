 always @ (posedge clk_i)
 begin
    if (rst_i[0])
        current_state <= #TCQ  4'b0001;
    else
        current_state <= #TCQ next_state;
 end