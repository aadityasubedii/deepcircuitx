 always @ (posedge clk_i)
 begin
    if (rst_i)
        current_state <= 5'b00001;
    else
        current_state <= next_state;
 end