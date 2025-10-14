always@(posedge i_clk)
    if (o_valid && !o_write)
        busy_reading_r <= 1'd1;
    else if (i_rdata_valid)
        busy_reading_r <= 1'd0;
