always @(posedge i_clk)
    if (push && in_wreq && !o_ack)
        ack_owed_r = 1'd1;
    else if (!i_req && o_ack)
        ack_owed_r = 1'd0;
        